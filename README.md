# FURIMAテーブル設計

## users テーブル
| Column            | Type   | Options                   |
| ----------------  | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
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


======================================

 class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  validates :title, :text, :genre, presence: true


  validates :genre_id, numericality: { other_than: 1 } 
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category
    validates :status
    validates :delivery_fee
    validates :shipping_area
    validates :shipping_day
  end

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :category
  # belongs_to_active_hash :status
  # belongs_to_active_hash :delivery_fee
  # belongs_to_active_hash :shipping_area
  # belongs_to_active_hash :shipping_day

  # validates :title, :text, :genre, presence: true


  # validates :genre_id, numericality: { other_than: 1 } 
end
================================================================


# This migration comes from active_storage (originally 20170806125915)
class CreateActiveStorageTables < ActiveRecord::Migration[5.2]
  def change
    create_table :active_storage_blobs do |t|
      t.string   :key,        null: false
      t.string   :filename,   null: false
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size,  null: false
      t.string   :checksum,   null: false
      t.datetime :created_at, null: false

      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false

      t.datetime :created_at, null: false

      t.index [ :record_type, :record_id, :name, :blob_id ], name: "index_active_storage_attachments_uniqueness", unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
end
=====================================================


====================================================
      t.string  :name,                  null: false, default: ""
      t.string  :text,                  null: false, default: ""
      t.integer :price,                 null: false, default: ""
      t.integer :category_id,           null: false
      t.integer :status_id,             null:false
      t.integer :delivery_fee_id,       null:false
      t.integer :shipping_area_id,      null:false
      t.integer :shipping_day_id,       null:false
      # t.references :user,               foreign_key: true
=========================================================================

## items テーブル
| Column            | Type      | Options                   |
| ----------------  | --------- | ------------------------- |
| name              | string    | null: false               |
| text              | string    | null: false               |
| category_id       | integer   | null: false               |
| status_id         | integer   | null: false               |
| delivery_fee_id   | integer   | null: false               |
| shipping_area_id  | integer   | null: false               |
| shipping_day_id   | integer   | null: false               |
| price             | integer   | null: false               |
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
