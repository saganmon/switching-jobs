$(function() {
  function buildHTML(condition) {
    var html =
      `<tbody class="conditions-table__body">
        <tr class="conditions-table__column__data" style="background-color: ghostwhite;">
          <td class="conditions-table__column__data--status">
            ${condition.phase}
          </td>
          <td class="conditions-table__column__data--result">
            ${condition.result}
          </td>
          <td class="conditions-table__column__data--company-name">
            ${condition.company_name}
          </td>
          <td class="conditions-table__column__data--company-area">
            ${condition.area}
          </td>
          <td class="conditions-table__column__data--date">
            ${condition.date}
          </td>
          <td class="conditions-table__column__data--memo">
            ${condition.memo}
          </td>
          <td class="conditions-table__column__data--edit">
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

  $('.body-conditions__new--button').on('click', function() {
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

  $('.conditions-table__column__data').mouseover(function() {
    $(this).css('backgroundColor', 'aquamarine')
  });

  $('.conditions-table__column__data').mouseleave(function() {
    $(this).css('backgroundColor', 'ghostwhite')
  });
});


