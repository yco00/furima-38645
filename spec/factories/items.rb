FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    descripition{Faker::Lorem.sentence}
    category_id{'2'}
    condition_id{'2'}
    price{Faker::Number.between(from:300,to:1000)}
    postage_id{'2'}
    area_id{'2'}
    shippingday_id{'2'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end  
  end
end 