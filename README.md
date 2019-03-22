## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail_adress|string|null: false, unique:true|
|password|string|null: false|
|first_name|string||
|last_name|string||
|first_name(kana)|string||
|last_name(kana)|string||
|birthday|integer||


### Association
- has_many :comments
- has_many :items, depend::destory
- has_many :orders
- has_many :reviews
- has_many :order_comments
- has_many :credits, depend::destory
- has_one :sns_credentials
- has_many :social_profiles


## social_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key: true|
|provider|varchara|unique:true|
|uid|varchara|unique:true|
|name|varchara||
|nickname|varchara||
|email|varchara||
|url|varchara||
|imege_url|varchara||
|description|varchara||
|other|text||
|credentials|text||
|raw_info|text||

### Association

- belongs_to :user



## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|profile|text| |
|avatar|string| |
|tel|integer|null: false|
|adress_id|integer|null: false, foreign_key: true|
|credit_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## adressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building_name|string| |
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|status_id|integer|null: false, foreign_key: true|
|delivery_fee_id|integer|null: false, foreign_key: true|
|delivery_date_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|avatar|string| |
|user_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|

### Association
- has_many :images, depend::destory
- has_many :category_items
- has_many :sizes
- has_many :likes, depend::destory
- has_many :orders, depend::destory
- has_many :comments, depend::destory
- belongs_to :delivery_date
- belongs_to :item_status
- belongs_to :delivery_method
- belongs_to :size
- belongs_to :brand
- belongs_to :profit
- belongs_to :delivery_fee
- belongs_to :user
- belongs_to :category

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false,foreign_key: true|

### Association
- belongs_to :item

## delivery_datesテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_date|string|null: false|


### Association
- has_many :items

## item_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|


### Association
- has_many :items


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|


### Association
- has_many :items
- has_many :cateforys

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|null: false, foreign_key: true|

### Association
- has_many :category_items
- belongs_to :size
- belongs_to :item
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id

## category_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false , foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :categories

## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false , foreign_key: true|
|delivery_cost|string|null: false|
|profit|string|null: false|

### Association
- has_many :items

## delivery_feesテーブル
|Column|Type|Options|
|------|----|-------|
|deliver_fee|string|null: false|

### Association
- has_many :items

## category_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|

### Association
- has_many :items

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false , foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|order_status|string|null: false|

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :order_status
- has_one :review

## order_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- has_many :orders

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false , foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|order_id|integer|null: false , foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|review|string|null: false|
|comment|text|null: false|

### Association
- belongs_to :users
- belongs_to :order

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false,unique:true |
|exiration_date_month|integer|null: false|
|exiration_date_year|integer|null: false|
|security_code_name|integer|null: false|

### Association
- belongs_to :user

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|sns_uid|integer|null: false|
|provider|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :sns_credential

## order_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|order_id|integer|null: false, foreign_key: true|
|comment|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :order
- belongs_to :user







