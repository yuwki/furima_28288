FactoryBot.define do
  factory :item_order do
    post_number           {"123-4567"}
    prefecture            {"2"}
    city                  {"熊本市"}
    house_number          {"1丁目"}
    building_name         {"森ビル"}
    phone_number          {"09012345678"}
    token                 {"abc123"}
    item_id               {"1"}
    user_id               {"2"}
    order_id              {"3"}
  end
end
