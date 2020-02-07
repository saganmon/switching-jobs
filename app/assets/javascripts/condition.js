$(function(){
  function buildHTML(condition){
    var html =
      `<tbody class="conditions-table__body">
        <tr class="conditions-table__column">
          <td class="conditions-table__column--status">
            ${condition.phase}
          </td>
          <td class:="conditions-table__column--result">
            ${condition.result}
          </td>
          <td class:="conditions-table__column--company-name">
            ${condition.company_name}
          </td>
          <td class:="conditions-table__column--company-area">
            ${condition.area}
          </td>
          <td class:="conditions-table__column--date">
            ${condition.date}
          </td>
          <td class:="conditions-table__column--memo">
            ${condition.memo}
          </td>
          <td class:="conditions-table__column--edit">
            <a href="/conditions/${condition.id}/edit"><i class="fas fa-edit button"></i></a>
            <a rel="nofollow" data-method="delete" href="/conditions/${condition.id}"><i class="fas fa-trash-alt button"></i></a>
          </td>
        </tr>
      </tbody>`
    return html
  }
  

  $('.body-conditions__new--button').on('click', function(){
    // console.log(this);
    $('.modal').fadeIn("slow");

    $('#new_condition').on('submit', function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      // console.log(formData);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data);
        $('.conditions-table').append(html);
      })
      .fail(function(){
        alert('Ajax通信に失敗しました');
      })
      $('.modal').fadeOut("slow");
    })
  })
})