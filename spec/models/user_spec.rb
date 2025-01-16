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
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password must include both letters and numbers'
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password must include both letters and numbers'
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ｂｃｂｃｂｃ'
        @user.password_confirmation = 'ｂｃｂｃｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password must include both letters and numbers'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name must be entered in full-width characters (Kanji, Hiragana, or Katakana)'
      end
      it 'last_nameが全角(アルファベット)では登録できない' do
        @user.last_name = 'ｇｔ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name must be entered in full-width characters (Kanji, Hiragana, or Katakana)'
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name must be entered in full-width characters (Kanji, Hiragana, or Katakana)'
      end
      it 'first_nameが全角(アルファベット)では登録できない' do
        @user.first_name = 'ｋｌ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name must be entered in full-width characters (Kanji, Hiragana, or Katakana)'
      end
      it 'last_name_readingが空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name reading can't be blank"
      end
      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading can't be blank"
      end
      it 'last_name_readingが半角では登録できない' do
        @user.last_name_reading = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name reading must be entered in full-width Katakana characters'
      end
      it 'last_name_readingが全角（漢字）では登録できない' do
        @user.last_name_reading = '青'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name reading must be entered in full-width Katakana characters'
      end
      it 'last_name_readingが全角（ひらがな）では登録できない' do
        @user.last_name_reading = 'あお'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name reading must be entered in full-width Katakana characters'
      end
      it 'last_name_readingが全角（数字）では登録できない' do
        @user.last_name_reading = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name reading must be entered in full-width Katakana characters'
      end
      it 'first_name_readingが半角では登録できない' do
        @user.first_name_reading = 'def'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name reading must be entered in full-width Katakana characters'
      end
      it 'first_name_readingが全角（漢字）では登録できない' do
        @user.first_name_reading = '赤'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name reading must be entered in full-width Katakana characters'
      end
      it 'first_name_readingが全角（ひらがな）では登録できない' do
        @user.first_name_reading = 'あか'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name reading must be entered in full-width Katakana characters'
      end
      it 'first_name_readingが全角（数字）では登録できない' do
        @user.first_name_reading = '４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name reading must be entered in full-width Katakana characters'
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
