$(function(){
  function buildNewCommentHTML(comment){
    var html =`<li class='is-item__comment--self clearfix'>
                 <a href = "", class = "is-item__comment--self__user">
                   <figure>
                     <img class = "", src = "https://blog-001.west.edge.storage-yahoo.jp/res/blog-61-58/hirodebu3913_0927/folder/1027331/71/37250371/img_0">
                     <figcaption>${comment.user_name}</figcaption>
                   </figure>
                 </a>
                 <div class = 'is-item__comment--self__body body'>
                   <div class = 'is-item__comment__body__text' >${comment.text}</div>
                   <div class = 'is-item__comment__body__icons clearfix'>
                     <time>
                       <i class = 'fa fa-clock-o'></i>
                       <span>${comment.created_time}前</span>
                     </time>
                   </div>
                 </div>
               </li>`
    return html;
  }

  $('#comment-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(new_comment){
      var html = buildNewCommentHTML(new_comment);
      $('.comments').append(html);
      $('.is-item__comment-form__textarea').val('')
    })
    .fail(function(){
      alert('error');
    })
  });
});
