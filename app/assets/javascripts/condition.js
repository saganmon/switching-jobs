$(function(){
  function buildHTML(condition){
    var html =
      `<tbody class="condition-table__body">
        <tr>
          <td>
            <div class:="" conditions-table__column--status="">
              ${condition.phase}
            </div>
          </td>
          <td>
            <div class:="" conditions-table__column--company-name="">
              ${condition.company_name}
            </div>
          </td>
          <td>
            <div class:="" conditions-table__column--company-area="">
              ${condition.area}
            </div>
          </td>
          <td>
            <div class:="" conditions-table__column--date="">
              ${condition.date}
            </div>
          </td>
          <td>
            <div class:="" conditions-table__column--memo="">
              ${condition.memo}
            </div>
          </td>
          <td>
            <div class:="" conditions-table__column--edit="">
              <a href="/conditions/${condition.user_id}/edit"><i class="fas fa-edit button"></i></a>
            </div>
          </td>
        </tr>
      </tbody>`
    return html
  }

  $('.body__new').on('click', function(){
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