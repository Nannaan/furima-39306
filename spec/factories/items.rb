FactoryBot.define do
  factory :item do
    name          {'test'}
    explain       {'test'}
    category_id   { 2 }
    condition_id  { 2 }
    delivery_id   { 2 }
    prefecture_id { 2 }
    schedule_id   { 2 }
    price         { 500 }
    user
  end
end
