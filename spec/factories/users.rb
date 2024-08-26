FactoryBot.define do
  factory :user do
    nickname { 'ニックネーム' }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 4) + '1a' }
    password_confirmation { password }
    first_name { '鈴木' }
    last_name { '太郎' }
    first_name_kana { 'スズキ' }
    last_name_kana { 'タロウ' }
    birth_date { '2024-01-01' }
  end
end
