require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end
    it 'building_nameがなくても保存ができること' do
      @item_order.building_name = nil
      expect(@item_order).to be_valid
    end
    it 'post_numberが空だと保存できないこと' do
      @item_order.post_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post number can't be blank")
    end
    it 'post_numberに-がないと保存できないこと' do
      @item_order.post_number = "1234567"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
    end
    it 'prefectureが空だと保存できないこと' do
      @item_order.prefecture = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefectureの値が1だと保存できないこと' do
      @item_order.prefecture = "1"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture is invalid. Input select prefectures.")
    end
    it 'cityが空だと保存できないこと' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @item_order.house_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @item_order.phone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid. Remove hyphen(-).(maxlength 11)")
    end
    it 'phone_numberに-があれば保存できないこと' do
      @item_order.phone_number = "090-1234-5678"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid. Remove hyphen(-).(maxlength 11)")
    end
    it 'phone_numberが12桁以上であれば保存できないこと' do
      @item_order.phone_number = "090-1234-56789"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid. Remove hyphen(-).(maxlength 11)")
    end
  end
end