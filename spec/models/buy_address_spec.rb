require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end 

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
        it 'すべての値が正しく入力されていれば保存できる' do
            expect(@buy_address).to be_valid
        end    
        it 'building_nameは空でも保存できること' do
            @buy_address.building_name = ''
            expect(@buy_address).to be_valid
        end
        it "tokenがあれば保存ができること" do
            expect(@buy_address).to be_valid
          end
    end

    context '内容に問題がある場合' do
        it 'zip_codeが空だと保存できない' do
            @buy_address.zip_code = ''
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Include hyphen(-)")
        end
        it 'zip_codeが「3桁ハイフン4桁」の半角文字列でないと保存がきない' do
            @buy_address.zip_code = '1234567'
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
        end
        it 'shipping_area_idが空だと保存できない' do
            @buy_address.shipping_area_id = ''
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Shipping area can't be blank")
        end
        it 'cityが空だと保存できないこと' do
            @buy_address.city = ''
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("City can't be blank")
        end
        it 'addressが空だと保存できないこと' do
            @buy_address.address = ''
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが空だと保存できないこと' do
            @buy_address.phone_number = ''
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end
        it 'phone_numberが12桁以上の半角数値だと保存できないこと' do
            @buy_address.phone_number = '123451234567'
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが9桁未満の半角数値でないと保存できないこと' do
            @buy_address.phone_number = '123456789'
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'userが紐付いていないと保存できないこと' do
            @buy_address.user_id = nil
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("User can't be blank")
        end    
        it 'itemが紐付いていないと保存できないこと' do
            @buy_address.item_id = nil
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Item can't be blank")
        end  
        it "tokenが空では登録できないこと" do
            @buy_address.token = nil
            @buy_address.valid?
            expect(@buy_address.errors.full_messages).to include("Token can't be blank")
          end   
    end
  end 
end
