class ItemOrder

  include ActiveModel::Model
  attr_accessor :post_number, :prefecture, :city, :house_number, :building_name, :phone_number, :token, :item_id, :user_id, :order_id

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  CITY_CODE_REGEX = /\A[ぁ-んァ-ン一-龥]/
  TEL_CODE_REGEX = /\A[a-zA-Z0-9]+\z/

  with_options presence: true do
    validates :post_number, format: {with: POSTAL_CODE_REGEX, message: "is invalid. Include hyphen(-)"}
    validates :prefecture,  numericality: { other_than: 1, message: "is invalid. Input select prefectures." }
    validates :city, format: {with: CITY_CODE_REGEX, message: "is invalid. Input your city infomations."}
    validates :house_number
    validates :phone_number, format: {with: TEL_CODE_REGEX, message: "is invalid. Remove hyphen(-).(maxlength 11)"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
