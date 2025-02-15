require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it 'imageとitem_nameとitem_textとcategory_idとsituation_idとshippingfee_idとprefecture_idとdeliveryday_idとpriceが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_textが空では保存できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item text can't be blank"
      end
      it 'category_idが1では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'situation_idが1では保存できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Situation can't be blank"
      end
      it 'shippingfee_idが1では保存できない' do
        @item.shippingfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shippingfee can't be blank"
      end
      it 'prefecture_idが1では保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'deliveryday_idが1では保存できない' do
        @item.deliveryday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliveryday can't be blank"
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角では保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be a number between ¥300 and ¥9,999,999'
      end
      it 'priceが半角英字では保存できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be a number between ¥300 and ¥9,999,999'
      end
      it 'priceが半角数字と英字の混合では保存できない' do
        @item.price = 'ab12'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be a number between ¥300 and ¥9,999,999'
      end
      it 'priceが¥300未満では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be a number between ¥300 and ¥9,999,999'
      end
      it 'priceが¥10,000,000以上では保存できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be a number between ¥300 and ¥9,999,999'
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
