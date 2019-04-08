crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
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
  link params[:keyword], search_items_path
  parent :root
end

crumb :category do |category|
  link category.name, category_path
  parent :root
end

crumb :middle_category do |middle_category|
  link middle_category.name, middle_category_path
  parent :category,middle_category.category
end

crumb :lower_category do |lower_category|
  link lower_category.name, lower_category_path
  parent :middle_category,lower_category.middle_category
end



crumb :brand do |brand|
  link brand.name, brand_path
  parent :root
end

