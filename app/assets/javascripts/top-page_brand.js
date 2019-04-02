$(function () {
  $(".brand__list").hover(
    function () {
      $(this).children("ul").show();
    },
    function () {
      $(this).children("ul").hide();
    }
  );
  $(".top-main-header-nav-brand ").on("mouseover", function () {
    $(this).css({
      color: "",
      backgroundColor: "red"
    });
  });
  $(".top-main-header-nav-brand ").on("mouseout", function () {
    $(this).css({
      color: "",
      backgroundColor: ""
    });
  });
});