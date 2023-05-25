FactoryBot.define do
  factory :item do
    name          { 'test' }
    explain       { 'test' }
    category_id   { 2 }
    condition_id  { 2 }
    delivery_id   { 2 }
    prefecture_id { 2 }
    schedule_id   { 2 }
    price         { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
