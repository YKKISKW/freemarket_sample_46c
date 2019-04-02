$(function(){
  $('#like-btn').on('click', function(){
    var item_id = $('.is-like-btn').val()
    var url = '/items/' + item_id + '/likes'
    $.ajax({
      url: url,
      type: 'POST',
      data: { item_id: item_id },
    })
    .done(function(){
      var likes_count = Number($('.is-likes-count').text())
      if ($('#like-btn').attr('class') === 'is-item__btns--left--like btn') {
        $('.is-item__btns--left--like').removeClass().addClass('is-item__btns--left--liked btn');
        $('.is-likes-count').text(likes_count + 1);
      } else if ($('#like-btn').attr('class') === 'is-item__btns--left--liked btn') {
        $('.is-item__btns--left--liked').removeClass().addClass('is-item__btns--left--like btn');
        $('.is-likes-count').text(likes_count - 1);
      }
    })
    .fail(function(){
      alert('error');
    })
  });
});
