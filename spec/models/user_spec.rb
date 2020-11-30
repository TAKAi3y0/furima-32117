require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'カラム全てが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_kanaが空では登録できないこと' do
      @user.last_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end

    it 'first_kanaが空では登録できないこと' do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'xxx111'
      @user.password_confirmation = 'xxx111'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'xxx11'
      @user.password_confirmation = 'xxx11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'xxx111'
      @user.password_confirmation = 'xxx1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it '重複したnicknameが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, nickname: @user.nickname)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    end

    it 'last_nameが半角では登録できないこと' do
      @user.last_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'first_nameが半角では登録できないこと' do
      @user.first_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_kanaが半角では登録できないこと' do
      @user.last_kana = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last kana kana Full-width katakana characters')
    end

    it 'first_kanaが半角では登録できないこと' do
      @user.first_kana = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana kana Full-width katakana characters')
    end

    it 'last_kanaが平仮名では登録できないこと' do
      @user.last_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last kana kana Full-width katakana characters')
    end

    it 'first_kanaが平仮名では登録できないこと' do
      @user.first_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana kana Full-width katakana characters')
    end

    it 'last_kanaが漢字では登録できないこと' do
      @user.last_kana = '阿亜'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last kana kana Full-width katakana characters')
    end

    it 'first_kanaが漢字では登録できないこと' do
      @user.first_kana = '阿亜'
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana kana Full-width katakana characters')
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'xxxxxxxxxxxx'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが半角英字のみの場合登録できない' do
      @user.password = 'xxxxxx'
      @user.password_confirmation = 'xxxxxx'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが半角数字のみの場合登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが全角英数字の場合登録できない' do
      @user.password = 'xxx１１１'
      @user.password_confirmation = 'xxx１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
  end
end
