# README


* Database creation

## users table
|Column             |Type      |Option                 |
| ----------------- | -------- | --------------------- |
|email              |string    |null:false, unique:true|
|encrypted_password |string    |null:false             |
|nickname           |string    |null:false             |
|last_name          |string    |null:false             |
|first_name         |string    |null:false             |
|last_name_kana     |string    |null:false             |
|first_name_kana    |string    |null:false             |
|birth_date         |date      |null:false             |
- has_many :items
- has_many :purchased_records


## items table
|Column             |Type      |Option                 |
| ----------------- | -------- | --------------------- |
|item_name          |string    |null:false             |
|details            |text      |null:false             |
|category_id        |integer   |null:false             |
|condition_id       |integer   |null:false             |
|shipping_charge_id |integer   |null:false             |
|prefecture_id      |integer   |null:false             |
|required_date_id   |integer   |null:false             |
|price              |integer   |null:false             |
|user               |references|foreign_key:true       |
- belongs_to :user
- has_one :purchased_record
- belongs_to :category(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :condition(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :shipping_charge(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :prefecture(extend ActiveHash::Associations::ActiveRecordExtensions)
- belongs_to :required_date(extend ActiveHash::Associations::ActiveRecordExtensions)


## purchased_records table
|Column      |Type      |Option          |
| ---------- | -------- | -------------- |
|user        |references|foreign_key:true|
|item        |references|foreign_key:true|
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses table
|Column             |Type      |Option                       |
|post_number        |string    |null:false                   |
|prefecture_id      |integer   |null:false                   |
|city_town          |string    |null:false                   |
|house_number       |string    |null:false                   |
|building           |string    |                             |
|phone_number       |string    |null:false                   |
|purchased_record   |references|null:false, foreign_key: true|
- belongs_to :purchased_record
- belongs_to :prefecture(extend ActiveHash::Associations::ActiveRecordExtensions)



<!-- * model creation(ActiveHash) -->
<!-- ## prefectures table(ActiveHash)
self.data = [
  {id:1, name: "?????????"},
  {id:2, name: "??????"},
  .
  .
  .
  {id:47, name: "??????"},
]
- has_many :addresses(include ActiveHash::Associations)
- has_many :shipping_from(include ActiveHash::Associations)

## categories table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "???????????????"},
  {id:3, name: "?????????"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations)


## conditions table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "??????"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations)


## shipping_charges table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "??????????????????????????????"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations)


## required_dates table(ActiveHash)
self.data = [
  {id:1, name: "___"},
  {id:2, name: "1~2??????????????????"},
  .
  .
  .
]
- has_many :items(include ActiveHash::Associations) -->
