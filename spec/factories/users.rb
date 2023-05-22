FactoryBot.define do
  factory :user do
    nickname              { 'Taro' }
    email                 { 'test@test.com' }
    password              { 'Password123' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birth_date            { '2023-01-01' }
  end
end
