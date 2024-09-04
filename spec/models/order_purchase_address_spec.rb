require 'rails_helper'

RSpec.describe OrderPurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_purchase_address = FactoryBot.build(:order_purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品の購入' do
    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_purchase_address).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @order_purchase_address.building_name = ''
        expect(@order_purchase_address).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @order_purchase_address.postal_code = ''
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに"-"が含まれていないとでは購入できない' do
        @order_purchase_address.postal_code = '1231234'
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages)
          .to include('Postal code Please include a hyphen in the postal code. (e.g., 123-4567)')
      end

      it 'prefecture_idが空では購入できない' do
        @order_purchase_address.prefecture_id = 1
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @order_purchase_address.city = ''
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空では購入できない' do
        @order_purchase_address.street = ''
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("Street can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order_purchase_address.phone_number = ''
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下だと購入できない' do
        @order_purchase_address.phone_number = '090123456'
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages)
          .to include('Phone number Please enter a valid phone number using only 10 or 11 digits without any hyphens.')
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @order_purchase_address.phone_number = '090123456789'
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages)
          .to include('Phone number Please enter a valid phone number using only 10 or 11 digits without any hyphens.')
      end

      it 'phone_numberが半角数値のみでないと購入できない' do
        @order_purchase_address.phone_number = '090-1234-5678'
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages)
          .to include('Phone number Please enter a valid phone number using only 10 or 11 digits without any hyphens.')
      end

      it 'user_idが空では購入できない' do
        @order_purchase_address.user_id = ''
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @order_purchase_address.item_id = ''
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できない' do
        @order_purchase_address.token = nil
        @order_purchase_address.valid?
        expect(@order_purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
