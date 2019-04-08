$(document).on('turbolinks:load', function(){

///////appendImage////////////////////////////////////////////////////////////////
 function appendImage(img,i,imageList) {
   var html = `<li class="is-image-li" id="${i}">
                <figure class="is-image-li__figure">
                  <img src="${img}">
                </figure>
                <div class="is-image-li__under">
                  <a href="#" class="is-image-li__under--e">編集<a>
                  <a href="#" class="is-image-li__under--e">削除<a>
                </div>
              </li>`
   imageList.append(html);
  }
//////////////////////////////////////////////////////////////////////////////////
//
///////inputFieldLis////////////////////////////////////////////////////////////////////
  var inputFieldList = $(".is-add-up")
  function appendInputField(isImgId){
    var html =`<input id="is-img-${isImgId+1}" multiple="multiple"  data-id="${isImgId+1}" class="is-upload-box-container__box--file" type="file" name="item_form[images][]">`
  inputFieldList.append(html);
  }
//////////////////////////////////////////////////////////////////////////////////////////
//
////removeField/////////////////////////////////////////////////////////////////////
  var removeFieldList = $(".is-upload-box-container")
  function appendRemoveField(removeImageId){
    var html = `<input value="${removeImageId}" multiple="multiple" type="hidden" name="item_form[remove_images][]">`
  removeFieldList.append(html);
}
//////////addClass//////////////////////////////////////////////////////////////////
  function addClass(){
    switch (imgCount){
      case 1:
        $("#is-add").addClass("is-item-1");
        break;
      case 2:
        $("#is-add").addClass("is-item-2");
        break;
      case 3:
        $("#is-add").addClass("is-item-3");
        break;
      case 4:
        $("#is-add").addClass("is-item-4");
        break;
      case 5:
        $("#is-add").addClass("is-item-5");
        break;
      case 6:
        $("#is-add").addClass("is-item-1");
        break;
      case 7:
        $("#is-add").addClass("is-item-2");
        break;
      case 8:
        $("#is-add").addClass("is-item-3");
        break;
      case 9:
        $("#is-add").addClass("is-item-4");
        break;
      case 10:
        $("#is-add").addClass("is-item-5");
        break;
    }
  }
////////////////////////////////////////////////////////////////////////////////////
////////removeClass/////////////////////////////////////////////////////////////////
    function removeClass(imgCount){
    switch (imgCount){
      case 1:
        $("#is-add").removeClass("is-item-1");
        break;
      case 2:
        $("#is-add").removeClass("is-item-2");
        break;
      case 3:
        $("#is-add").removeClass("is-item-3");
        break;
      case 4:
        $("#is-add").removeClass("is-item-4");
        break;
      case 5:
        $("#is-add").removeClass("is-item-5");
        break;
      case 6:
        $("#is-add").removeClass("is-item-1");
        break;
      case 7:
        $("#is-add").removeClass("is-item-2");
        break;
      case 8:
        $("#is-add").removeClass("is-item-3");
        break;
      case 9:
        $("#is-add").removeClass("is-item-4");
        break;
      case 10:
        $("#is-add").removeClass("is-item-5");
        break;
    }
  }
////////////////////////////////////////////////////////////////////////////////////
//
//////appendErrorMessage/////////////////////////////////////////////////////////////////////////////////////////////////
    var errorMessage = $(".is-error-message")
    function appendErrorMessage(){
      var html = `<li class = "is-error-message__li">ファイル形式はjpeg、またはpngが使用できます</li>`;
      errorMessage.append(html);
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
////イメージアップローダーで複数画像投稿機能///////////////////////////////////////////////////////////////////////////////////
     isLabelFor = $(".is-upload-box-container").find("#is-add").attr("for");// 未アップロード時のラベルのforを取得する
     file = ""// ファイルの初期化
     imgCount = Number(isLabelFor.substr(7,1));
  $(".is-upload-box-container").change(`#${isLabelFor}`,function(e){
    e.preventDefault();
// アップローダーのdata-idを取得
      var isImgId = $(this).find(`#${isLabelFor}`).data('id');
// アップローダーで選択したimageファイルを取得
     file = $(this).find(`#${isLabelFor}`).prop('files')[0];

     var permitType = ['image/jpeg', 'image/png', 'image/gif'];
            if (file && permitType.indexOf(file.type) == -1) {
                appendErrorMessage();//エラ-
                $(this).find(`#${isLabelFor}`).val('');
                return
              }
      var reader = new FileReader()
      reader.onload = function(e){
      var imgName = e.target.result;
// 取得したimgをプレビューさせる
      if (imgCount >= 5){
        imageList = $("#is-image-ul-2");
        } else {
        imageList = $("#is-image-ul-1");
        }
      appendImage(imgName,isLabelFor,imageList);
//次のアップローダーを追加する
      appendInputField(isImgId);
//viewの幅を変更させるクラスの追加
    if (imgCount < 9){
      removeClass(imgCount)
      imgCount = imgCount + 1
      addClass(imgCount)
    } else {
      imgCount = imgCount + 1
      $("#is-add").removeClass();
      $(".is-upload-box-container__box--text").text("");
    }
//次の画像を選択させるためにlabelのforを変更
      $("#is-add").attr("for",`is-img-${isImgId+1}`);
//変更後のlabelのforを取得
       isLabelFor = $(".is-upload-box-container").find("#is-add").attr("for")
  }
    reader.readAsDataURL(file);
  });
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
////削除ボタンの処理////////////////////////////////////////////////////////////////////////////////////////////////////////
  $(".is-upload-box-container").on("click",".is-image-li__under--e",function(e){
    e.preventDefault();
//削除対象のliのIDを取得
    var imgId = $(this).parent().parent().attr("id");
//liのidに紐づくinputタグのdata-idを取得
    var imgNo = $(".is-add-up").find(`#${imgId}`).data('id');
    if (imgCount < 10){
      removeClass(imgCount)
      imgCount = imgCount - 1
      addClass(imgCount)
    } else {
      imgCount = imgCount - 1
      $("#is-add").addClass("is-upload-box-container__box is-item-4");
      $(".is-upload-box-container__box--text").text("ドラッグアンドドロップまたはクリックしてファイルをアップロード");
    }
    $(this).parent().parent().remove();
    $(".is-add-up").find(`#${imgId}`).remove();
    //編集画面で投稿ずみの画像を削除するとき
      if ($(this).data("id")){
        appendRemoveField($(this).data("id"));
      }
  })
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
////配送方法の選択/////////////////////////////////////////////////////////////////////////////////////////////////////////
removeInclude = ""
removeExclude = ""
  $("#item_form_delivery_fee").change(function(){
    $("#is-delivery_method").removeClass("is-form-group__label-hiden").addClass("is-form-group__label")
    $("#is-delivery_method-span").removeClass("is-form-group__hiden");
    var selectContent = $("#item_form_delivery_fee").val();
    switch (selectContent){
      case "":
        $("#is-dm-error").addClass("is-form-group__hiden");
        $("#item_form_delivery_method-exclude").addClass("is-form-group__hiden");
        $("#item_form_delivery_method-include").addClass("is-form-group__hiden");
        $("#is-delivery_method").removeClass("is-form-group__label").addClass("is-form-group__label-hiden");
        $("#is-delivery_method-span").addClass("is-form-group__hiden");
        break;
      case "include":
        $("#is-dm-error").removeClass("is-form-group__hiden");
        if ($("#item_form_delivery_method-exclude").length == 1){
          removeExclude = $("#item_form_delivery_method-exclude").remove();
        }
        if (removeInclude !== ""){
          removeInclude.removeClass("is-form-group__hiden");
          $("#is-select-wrap-dm").append(removeInclude);
        } else{
          $("#item_form_delivery_method-include").removeClass("is-form-group__hiden");
        }
        break;
      case "exclude":
        $("#is-dm-error").removeClass("is-form-group__hiden");
        if ($("#item_form_delivery_method-include").length == 1){
          removeInclude = $("#item_form_delivery_method-include").remove();
        }
        if (removeExclude !== ""){
          removeExclude.removeClass("is-form-group__hiden");
          $("#is-select-wrap-dm").append(removeExclude);
        } else{
          $("#item_form_delivery_method-exclude").removeClass("is-form-group__hiden");
        }
        break;
    }
  });
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
////価格の計算/////////////////////////////////////////////////////////////////////
      var stack = []
  $("#item_form_price").keyup(function(){
    var input = ""
    stack.push(1);
    setTimeout(function() {
    stack.pop();
    //取り出したstackの中身がなければ処理をする
    //stackの中身がなくなるのは、一番最後の入力から0.5秒後になる
    //なので、一番最後の入力から0.5秒後に以下の処理が走る
    if (stack.length == 0) {
      //最後キー入力後に処理したいイベント
      //数値型に変換
      input = Number($("#item_form_price").val());
      //数値型判定
      result = $.isNumeric(input)
      if (result == true && input >= 300 && input < 10000000 ){
        var commission = input * 0.1;
        var profit = input * 0.9;
        $("#is-commission").text("");
        $("#is-profit").text("");
        $("#is-commission").append(`¥${commission}`);
        $("#is-profit").append(`¥${profit}`);
      } else {
        $("#is-commission").text("-");
        $("#is-profit").text("-");
      }
      stack = [];//stackを初期化
    }
  }, 500);
   });
/////////////////////////////////////////////////////////////////////////////////
});
