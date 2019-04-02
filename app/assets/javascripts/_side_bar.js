//.表示しているページのメニューバーのclassをactiveにする
$(function(){
    $('.um-mypage-nav-list-item').each(function(){
        var $href = $(this).attr('href');
        if(location.href.match($href)) {
        $(this).addClass('active');
        }else {
        $(this).removeClass('active');
        }
    });
});
