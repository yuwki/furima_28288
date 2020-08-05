# FURIMAテーブル設計

## users テーブル
| Column            | Type   | Options                   |
| ----------------  | ------ | ------------------------- |
| nickname          | string | null: false               |
| mail              | string | null: false, unique: true |
| password          | string | null: false               |
| first_name        | string | null: false               |
| last_name         | string | null: false               |
| first_name_kana   | string | null: false               |
| last_name_kana    | string | null: false               |
| birth_date_year   | string | null: false               |
| birth_date_month  | string | null: false               |
| birth_date_day    | string | null: false               |
### Association
- has_many :items
- has_many :comments
- has_many :orders

## items テーブル
| Column            | Type   | Options                  |
| ----------------  | ------ | ------------------------ |
| items_name        | string | null: false              |
| items_text        | string | null: false              |
| status            | string | null: false              |
| delivery_fee      | string | null: false              |
| shipping_area     | string | null: false              |
| sshipping_days    | string | null: false              |
| price             | string | null: false              |
| user_id           | reference | null: false, FK:true  |
### Association
- belongs_to :user
- belongs_to :order
- belongs_to :adress
- has_many :comments
- has_one_attached :image
- belongs_to_active_hash :categories

## comments テーブル
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| text              | string    | null: false              |
| user_id           | reference | null: false, FK:true     |
| item_id           | reference | null: false, FK:true     |
### Association
- belongs_to :user
- belongs_to :item

## orders テーブル
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| price             | integer   | null: false              |
| user_id           | reference | null: false, FK:true     |
| item_id           | reference | null: false, FK:true     |
### Association
- belongs_to :user
- belongs_to :item

## adresses テーブル
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| post_number       | integer   | null: false              |
| preffecture       | string    | null: false              |
| city              | string    | null: false              |
| house_number      | string    | null: false              |
| building_name     | string    |                          |
| phone_number      | integer   | null: false, unique: key |
### Association
- belongs_to :item

## categories テーブル
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| genre             | integer   | null: false              |
### Association
