require 'rails_helper'

RSpec.describe RecordOrder, type: :model do
  describe '購入履歴の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @record_order = FactoryBot.build(:record_order, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_order).to be_valid
      end
      it '建物名は空でも保存できること' do
        @record_order.building = ''
        expect(@record_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @record_order.postal_code = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_order.postal_code = '1234567'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @record_order.prefecture_id = 1
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @record_order.city = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @record_order.address = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @record_order.phone_number = ''
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が全角数字だと保存できないこと' do
        @record_order.phone_number = '０９０１２３４５６７８'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下では保存できないこと' do
        @record_order.phone_number = '012345678'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上では保存できないこと' do
        @record_order.phone_number = '001123456789'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号がハイフンを含むと保存できないこと' do
        @record_order.phone_number = '090-1234-5678'
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @record_order.user_id = nil
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @record_order.item_id = nil
        @record_order.valid?
        expect(@record_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
