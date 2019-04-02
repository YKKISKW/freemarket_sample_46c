crumb :top do
  link "メルカリ", top_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :top
end

crumb :profile do
  link "プロフィール", profile_path
  parent :mypage
end

crumb :userconfirm do
  link "本人情報の登録", userconfirm_path
  parent :mypage
end

crumb :userlogout do
  link "ログアウト", userlogout_path
  parent :mypage
end

crumb :credit do
  link "支払い方法", credit_path
  parent :mypage
end

crumb :creditregistration do
  link "クレジットカード情報入力"
  parent :credit
end

crumb :search do |keyword|
  link params[:keyword], items_search_path
  parent :top
end
