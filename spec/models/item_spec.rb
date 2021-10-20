require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end 

 describe '商品出品機能' do
  context '商品の出品ができるとき' do
    it 'image、name、text、category_id、condition_id、shipping_cost_id、shipping_area_id、shipping_day_id、priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
    it 'priceが300円以上だと登録ができる' do
      @item.price = '300'
      expect(@item).to be_valid
    end
    it 'priceが半角数値であれば登録ができる' do
      @item.price = '1000'
      expect(@item).to be_valid     
    end
  end

  context '商品の出品ができないとき' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空では登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'shipping_cost_idが空では登録できない' do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it 'shipping_area_idが空では登録できない' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'priceが300円以下では登録ができない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end
    it 'priceが10000000円以上では登録ができない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
    it 'priceが半角数値でなければ登録ができない' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end  
 end  
end
