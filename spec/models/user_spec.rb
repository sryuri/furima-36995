require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end 

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'email、passwordとpassword_confirmation、nickname、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end  
      it 'passwordが半角英数混合であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end  
    end
  
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 
      it 'family_nameが空では登録できない' do
        @user.family_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end  
      it 'emailに＠がなければ登録できない' do
        @user.email = 'aaaaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end 
      it 'passwordが全角文字を含む場合登録できない' do
        @user.password = '123あああ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end  
      it 'family_nameは、全角（漢字・ひらがな・カタカナ）でなければ登録ができない' do
        @user.family_name = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'first_nameは、全角（漢字・ひらがな・カタカナ）でなければ登録ができない' do
        @user.first_name = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'family_name_kanaは、全角（カタカナ)でなければ登録ができない' do
        @user.family_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'first_name_kanaは、全角（カタカナ)でなければ登録ができない' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end