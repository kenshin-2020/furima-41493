require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_readingとfirst_name_reading、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailに@を含まないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordに全角があれば登録できない' do
      end
      it 'passwordが数字のみでは登録できない' do
      end
      it 'passwordが英字のみでは登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_nameが半角では登録できない' do
      end
      it 'last_nameが全角(アルファベット)では登録できない' do
      end
      it 'first_nameが半角では登録できない' do
      end
      it 'first_nameが全角(アルファベット)では登録できない' do
      end
      it 'last_name_readingが空では登録できない' do
      end
      it 'first_name_readingが空では登録できない' do
      end
      it 'first_name_readingが半角では登録できない' do
      end
      it 'first_name_readingが全角（漢字）では登録できない' do
      end
      it 'first_name_readingが全角（ひらがな）では登録できない' do
      end
      it 'first_name_readingが全角（数字）では登録できない' do
      end
      it 'last_name_readingが空では登録できない' do
      end
      it 'last_name_readingが全角（漢字）では登録できない' do
      end
      it 'last_name_readingが全角（ひらがな）では登録できない' do
      end
      it 'last_name_readingが全角（数字）では登録できない' do
      end
      it 'birth_dateが空では登録できない' do
      end
    end
  end
end
