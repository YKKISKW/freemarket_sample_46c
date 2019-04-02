$(function () {

  $(".category__list").hover(
    function () {
      $(this).children("ul").show();
    },
    function () {
      $(this).children("ul").hide();
    }
  );
  $(".top-main-header-nav-parent ").on("mouseover", function () {
    $(this).css({
      color: "",
      backgroundColor: "red"
    });
  });
  $(".top-main-header-nav-parent").on("mouseout", function () {
    $(this).css({
      color: "",
      backgroundColor: ""
    });
  });
  $('.top-main-header-nav-parent').hover(
    function () {
      $(this).children('ul').show();
    },
    function () {
      $(this).children('ul').hide();
    }
  );
  $(".top-main-header-nav-child").on("mouseover", function () {
    $(this).css({
      color: "",
      backgroundColor: "#eee"
    });
  });
  $(".top-main-header-nav-child").on("mouseout", function () {
    $(this).css({
      color: "",
      backgroundColor: ""
    });
  });
  $('.top-main-header-nav-child').hover(
    function () {
      $(this).children('ul').show();
    },
    function () {
      $(this).children('ul').hide();
    }
  );
  $(".top-main-header-nav-grand-child").on("mouseover", function () {
    $(this).css({
      color: "",
      backgroundColor: "#eee"
    });
  });
  $(".top-main-header-nav-grand-child").on("mouseout", function () {
    $(this).css({
      color: "",
      backgroundColor: ""
    });
  });


});