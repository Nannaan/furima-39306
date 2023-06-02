FactoryBot.define do
  factory :record_order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '函館市' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '0123456789' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
