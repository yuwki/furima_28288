class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many_attached :images
  has_one :order

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :images
  end
  validates_inclusion_of :price, in: 300..9999999

  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
    
  end

end