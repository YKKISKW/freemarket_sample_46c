$(function(){
  $(".is-change").on('click', function(){
    $(".is-modal").fadeIn();
  })
  $(".cancel-btn,.is-modal").unbind().click(function(){
    $(".is-modal").fadeOut();
  })
});
