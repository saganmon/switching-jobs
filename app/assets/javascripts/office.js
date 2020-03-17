$(function() {
  $('.body-offices__find--box').on('keyup', function() {
    var keyword = $(this).val();
    var regExp = new RegExp(keyword);

    $('.offices-table').find('tr').hide().each(function() {
      var tr = $(this);
      $(this).find('td').each(function() {
        if($(this).text().match(regExp)) {
          tr.show();
        }
      })
    })
  });

  $('.offices-table__column__data')
    .mouseenter(function() {
      $(this).css('backgroundColor', 'aquamarine')
    })
    .mouseleave(function() {
      $(this).css('backgroundColor', 'ghostwhite')
    });
});