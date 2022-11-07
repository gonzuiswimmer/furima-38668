# README


* Database creation

## users table
|Column             |Type      |Option          |
|email              |string    |null:false      |
|encrypted_password |string    |null:false      |
|nickname           |string    |null:false      |
|last_name          |string    |null:false      |
|first_name         |string    |null:false      |
|last_name_kana     |string    |null:false      |
|first_name_kana    |string    |null:false      |
|birth_year_id      |integer   |null:false      |
|birth_month_id     |integer   |null:false      |
|birth_date_id      |integer   |null:false      |
- has_many :items
- has_many :purchased_records
- belongs_to :birth_year(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :birth_month(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :birth_date(extend ActiveHash::Associations::ActiveRecordExtensions)


## items table
|Column             |Type      |Option                 |
|item_name          |string    |null:false             |
|details            |text      |null:false             |
|category_id        |integer   |null:false             |
|condition_id       |integer   |null:false             |
|shipping_charge_id |integer   |null:false             |
|prefecture_id      |integer   |foreign_key:true|
|required_date_id   |integer   |null:false             |
|price              |integer   |null:false             |
|user               |references|foreign_key:true       |
- belongs_to :user
- has_one :purchased_record
- has_one_attached :image
- belongs_to :category(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :condition(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :shipping_charge(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :prefecture(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :required_date(extend ActiveHash::Associations::ActiveRecordExtensions)


## purchased_records table
|Column      |Type      |Option          |
|user        |references|foreign_key:true|
|item        |references|foreign_key:true|
|address     |references|foreign_key:true|
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses table
|Column       |Type      |Option          |
|post_number  |string    |null:false      |
|prefecture_id|integer   |foreign_key:true|
|city_town    |text      |null:false      |
|house_number |text      |null:false      |
|building     |text      |                |
- belongs_to :purchased_record
- belongs_to :prefecture(extend ActiveHash::Associations::ActiveRecordExtensions)


## prefectures table(ActiveHash)
self.data = [
  {id:1, name: "北海道"},
  {id:2, name: "青森"},
  .
  .
  .
  {id:47, name: "沖縄"},
]
- has_many :addresses(include ActiveHash::Associations)
- has_many :shipping_from(include ActiveHash::Associations)

## categories table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "レディース"},
  {id:3, name: "メンズ"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations)


## conditions table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "新品"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations)


## shipping_charges table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "着払い（購入者負担）"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations)


## required_dates table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "1~2日以内で発送"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations)


## years table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "1982"},
  {id:3, name: "1983"},
  .
  .
  .
  {id:101, name: "2022"},
]
- has_many :users(include ActiveHash::Associations)


## months table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "1"},
  {id:3, name: "2"},
  .
  .
  .
  {id:13, name: "12"},
]
- has_many :users(include ActiveHash::Associations)


## dates table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "1"},
  {id:3, name: "2"},
  .
  .
  .
  {id:32, name: "31"},
]
- has_many :users(include ActiveHash::Associations)
