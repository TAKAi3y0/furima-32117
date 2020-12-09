require 'rails_helper'

RSpec.describe ProductBuy, type: :model do
  describe '購入情報の保存' do
    before do
      @product_buy = FactoryBot.build(:product_buy, user_id: 1, product_id: 1)
    end

    context '登録成功時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@product_buy).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @product_buy.building = nil
        expect(@product_buy).to be_valid
      end
    end
    context '登録失敗時' do
      it '郵便番号が空だと保存できないこと' do
        @product_buy.zipcode = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Zipcode can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @product_buy.zipcode = '1234567'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Zipcode Input correctly')
      end
      it '郵便番号に全角があると保存できないこと' do
        @product_buy.zipcode = '１２３-４５６７'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Zipcode Input correctly')
      end
      it '市区町村が空だと保存できないこと' do
        @product_buy.city = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @product_buy.street = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @product_buy.phone = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が12桁だと保存できないこと' do
        @product_buy.phone = 123_456_789_012
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Phone Input only number')
      end
      it '電話番号が全角だと保存できないこと' do
        @product_buy.phone = '１２３４５６７８９０１'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Phone Input only number')
      end
      it '電話番号がハイフンがあると保存できないこと' do
        @product_buy.phone = '123-4567-8901'
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Phone Input only number')
      end
      it 'areaが---だと商品は保存できない' do
        @product_buy.area_id = 1
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include('Area Select')
      end
      it 'tokenが空では保存できないこと' do
        @product_buy.token = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できないこと' do
        @product_buy.user_id = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では保存できないこと' do
        @product_buy.product_id = nil
        @product_buy.valid?
        expect(@product_buy.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
