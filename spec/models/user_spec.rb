require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "nickname,email,password,password_confirmation,
          first_name,last_name,first_name_kana,last_name_kana,birth_dateが存在すれば登録できる" do
      end
    end

    context '新規登録できない場合' do
      # ユーザー情報
      it 'nicknameが空では登録できない' do
      end
      it "emailが空では登録できない" do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it "passwordが空では登録できない" do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordは半角英数字の混合でないと登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end

      # 本人情報確認
      it "first_nameが空だと登録できない" do
      end
      it "first_nameは全角でないと登録できない"do
      end
      it "last_nameが空だと登録できない" do
      end
      it "last_nameは全角でないと登録できない"do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaは全角カタカナでないと登録できない"do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "last_name_kanaは全角カタカナでないと登録できない"do
      end
      it "birth_dateが空だと登録できない" do
      end
    end
  end
end
