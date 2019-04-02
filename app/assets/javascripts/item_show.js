$(function() {
  var $slider = $('.is-slider');
  if ($slider.length < 1) { return; }

  var $thumbs = $('.is-thumbnails__item');

  $slider.slick({
    arrows: false,
  });

  $('.is-thumbnails__item:first').addClass('current');

  $thumbs.on('mouseover', function(e){
    e.preventDefault();
    var index = $thumbs.index(this);
    $slider.slick('slickGoTo', index, true);
  });

  $slider.on('beforeChange', function(event, slick, currentSlide, nextSlide){
    var currentClass = 'current';
    $thumbs.removeClass(currentClass)
      .eq(nextSlide).addClass(currentClass);
  });
});
