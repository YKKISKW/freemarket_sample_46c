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
- has_many :items, dependent::destory
- has_many :orders
- has_many :reviews
- has_many :order_comments
- has_one :credit, dependent::destory
- has_many :sns_credentials
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
|status|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_date|integer|null: false|
|delivery_method|integer|null: false|
|price|integer|null: false|
|avatar|string| |
|user_id|integer|null: false, foreign_key: true|
|size|integer||
|item_status|string|null: false|


### Association
- has_many :images, dependent::destory
- has_many :likes, dependent::destory
- has_many :orders, dependent::destory
- has_many :comments, dependent::destory
- belongs_to :brand
- belongs_to :profit
- belongs_to :user
- belongs_to :category


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false,foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false , foreign_key: true|
|profit|string|null: false|

### Association
- has_many :items

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false , foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :review


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


## creditテーブル
| Column      | Type    | Options                        |
|-------------|---------|--------------------------------|
| user_id     | integer | null: false, foreign_key: true |
| customer_id | string  | null: false,                   |
| card_id     | string  |                                |

### Association
- belongs_to :user


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|sns_uid|integer|null: false|
|provider|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## order_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|order_id|integer|null: false, foreign_key: true|
|comment|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :order
- belongs_to :user
