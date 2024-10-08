FactoryBot.define do
  factory :order_purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'テスト市' }
    street { 'テスト町' }
    phone_number { '09012345678' }
    building_name { 'テストビル' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
