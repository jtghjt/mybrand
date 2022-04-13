require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
    sleep 0.1
  end

  describe 'カスタマー新規登録' do
    context '新規登録できる場合' do
      it '入力項目が全て存在すれば登録できる' do
        expect(@customer).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @customer.nickname = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @customer.email = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@が含まれないと登録できない' do
        @customer.email = 'aa'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複していると登録できない' do
        @customer.save
        another_customer = FactoryBot.build(:customer)
        another_customer.email = @customer.email
        another_customer.valid?
        expect(another_customer.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @customer.password = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @customer.password = '11aaa'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英字のみでは登録できない' do
        @customer.password = 'aaaaaa'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordは数字のみでは登録できない' do
        @customer.password = '123456'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordは全角では登録できない' do
        @customer.password = 'あかさたなは'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが違うと登録できない' do
        @customer.password = 'aaa111'
        @customer.password_confirmation = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @customer.last_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @customer.last_name = 'satou'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空だと登録できない' do
        @customer.first_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @customer.first_name = 'tarou'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが空だと登録できない' do
        @customer.last_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角(カタカナ)でないと登録できない' do
        @customer.last_name_kana = 'さとう'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが空だと登録できない' do
        @customer.first_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角(カタカナ)でないと登録できない' do
        @customer.first_name_kana = 'たろう'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @customer.birthday = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
