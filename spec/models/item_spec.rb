require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("spec/fixtures/test_image.jpg")
  end

  describe '出品情報の保存' do
    context "出品情報が保存できる場合" do
      it "必要項目が全て揃えば保存される" do
        expect(@item).to be_valid
      end
     end
    context "出品情報が保存できない場合" do
      it "商品名がないと出品情報は保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明がないと出品情報は保存できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "商品価格がないと出品情報は保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it "商品価格が300円以下だと出品情報は保存できない" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end 
      it "商品価格が9999999円以上だと出品情報は保存できない" do
        @item.price = "1000000000000000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end 
      it "商品ジャンルがないと出品情報は保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end 
      it "商品状態がないと出品情報は保存できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end 
      it "配送料の負担がないと出品情報は保存できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end 
      it "発送地域がないと出品情報は保存できない" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end 
      it "発送日数がないと出品情報は保存できない" do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end 
      it "ユーザーが紐付いていない商品状態は保存できない" do
        @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
    end
  end
end