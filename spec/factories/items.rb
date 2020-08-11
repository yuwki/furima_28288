FactoryBot.define do
  factory :item do
    name                 {Faker::Name.initials(number: 2)}
    text                 {Faker::Lorem.sentence}
    price                {"10000"}
    category_id          {"2"}
    status_id            {"2"}
    delivery_fee_id      {"2"}
    shipping_area_id     {"2"}
    shipping_day_id      {"2"}
    association :user
  end
end