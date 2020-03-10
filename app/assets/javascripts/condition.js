$(function(){
  function buildHTML(condition) {
    var html =
      `<tbody class="conditions-table__body">
        <tr class="conditions-table__column" style="background-color: ghostwhite;">
          <td class="conditions-table__column--status">
            ${condition.phase}
          </td>
          <td class="conditions-table__column--result">
            ${condition.result}
          </td>
          <td class="conditions-table__column--company-name">
            ${condition.company_name}
          </td>
          <td class="conditions-table__column--company-area">
            ${condition.area}
          </td>
          <td class="conditions-table__column--date">
            ${condition.date}
          </td>
          <td class="conditions-table__column--memo">
            ${condition.memo}
          </td>
          <td class="conditions-table__column--edit">
            <a href="/conditions/${condition.id}/edit">
              <i class="fas fa-edit button"></i>
            </a>
            <a data-confirm="活動を削除します。よろしいですか？" class="delete" data-remote="true" rel="nofollow" data-method="delete" href="/conditions/${condition.id}">
              <i class="fas fa-trash-alt button"></i>
            </a>
          </td>
        </tr>
      </tbody>`
    return html;
  };

  $('.body-conditions__new--button').on('click', function(){
    $('.modal-overlay').fadeIn("slow");
    $('#new_condition').on('submit', function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(condition){
        var html = buildHTML(condition);
        $('.conditions-table').append(html);
        $('#new_condition')[0].reset();
        $('.new-status__send').prop('disabled', false);  
      })
      .fail(function(){
        alert('Ajax通信に失敗しました');
      })
      $('.modal-overlay').fadeOut("slow");
    });
  });

  $('.body-conditions__find--box').on('keyup', function() {
    var keyword = $(this).val();
    var regExp = new RegExp(keyword);
    $('.conditions-table').find('tr').hide().each(function() {
      var tr = $(this);
      $(this).find('td').each(function() {
        if($(this).text().match(regExp)) {
          tr.show();
        }
      });
    });
  });

  $('a[data-method="delete"]').on('ajax:success', function() {
    $(this).parent().parent().parent().remove();
  });

  $('.conditions-table__column').mouseover(function(){
    $(this).css('backgroundColor', 'aquamarine')
  });

  $('.conditions-table__column').mouseleave(function(){
    $(this).css('backgroundColor', 'ghostwhite')
  });
});


