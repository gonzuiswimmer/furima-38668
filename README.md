# README


* Database creation

## users table
|Column  |Type      |Option          |
|name    |string    |null:false, unique:true|
|password|integer   |null:false, unique:true|
|item    |references|foreign_key:true|
|purchase|references|foreign_key:true|

- has_many :items
- has_many :purchased_records

## item table
|Column     |Type      |Option                 |
|item_name  |string    |null:false, unique:true|
|details    |text      |null:false             |
|exibit_date|string    |null:false             |
|user       |references|foreign_key:true       |
|purchase   |references|foreign_key:true       |

- has_many :users
- belongs_to :purchased_record

## address table
|Column     |Type      |Option          |
|post_number|integer   |null:false      |
|prefecture |text      |null:false      |
|others     |string    |null:false      |
|purchase   |references|foreign_key:true|

- has_many :purchased_records

## purchased_record table
|Column      |Type      |Option          |
|user        |references|foreign_key:true|
|address     |references|foreign_key:true|
|item        |references|foreign_key:true|
<!-- |date_of_sale|datetime  |null:false      | -->

- belongs_to :address
- belongs_to :user
- belongs_to :item

