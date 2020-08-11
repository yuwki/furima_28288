require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報の保存' do
    context "出品情報が保存できる場合" do
      it "必要項目があればツイートは保存される" do
        expect(@item).to be_valid
        binding.pry
      end
    #   it "テキストのみあればツイートは保存される" do
    #     @tweet.image = ""
    #     expect(@tweet).to be_valid
    #   end
    # end
    # context "ツイートが保存できない場合" do
    #   it "テキストがないとツイートは保存できない" do
    #     @tweet.text = ""
    #     @tweet.valid?
    #     except(@tweet.errors.full_messages).to include("Text can't be blank")
    #   end     
    #   it "ユーザーが紐付いていないとツイートは保存できない" do
    #     @tweet.user = nil
    #       @tweet.valid?
    #       expect(@tweet.errors.full_messages).to include("User must exist")
    #     end
    end
  end
end