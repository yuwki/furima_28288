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
| birth_date        | date   | null: false               |
### Association
- has_many :items
- has_many :comments
- has_many :orders

## items テーブル
| Column            | Type      | Options                   |
| ----------------  | --------- | ------------------------- |
| name              | string    | null: false               |
| text              | string    | null: false               |
| category_id       | integer   | null: false               |
| status_id         | integer   | null: false               |
| delivery_fee_id   | integer   | null: false               |
| shipping_area_id  | integer   | null: false               |
| shipping_days_id  | integer   | null: false               |
| price             | string    | null: false               |
| user              | reference | null: false, FK:true      |
### Association
- belongs_to :user
- has_one :order
- has_one :adress
- has_many :comments
- has_one_attached :image
- belongs_to_active_hash :categories
- belongs_to_active_hash :statuses
- belongs_to_active_hash :delivery_fees
- belongs_to_active_hash :shipping_areas
- belongs_to_active_hash :shipping_days

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
| user              | reference | null: false, FK:true     |
| item              | reference | null: false, FK:true     |
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
| phone_number      | string    | null: false, unique: key |
### Association
- belongs_to :item

## categories (Active Hash)
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| category          | integer   | null: false              |
### Association

## statuses (Active Hash)
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| status            | integer   | null: false              |
### Association

## delibery_fees (Active Hash)
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| delivery_fee      | integer   | null: false              |
### Association

## shipping_areas (Active Hash)
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| shipping_area     | integer   | null: false              |
### Association

## shipping_days (Active Hash)
| Column            | Type      | Options                  |
| ----------------  | --------- | ------------------------ |
| shipping_days     | integer   | null: false              |
### Association
