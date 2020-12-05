require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('public/image/008.jpg')
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it '全て存在すれば保存される' do
        expect(@product).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it 'nameがないと商品は保存できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationがないと商品は保存できない' do
        @product.explanation = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'priceがないと商品は保存できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageがないと商品は保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'categoryが---だと商品は保存できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end

      it 'statusが---だと商品は保存できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Status Select')
      end

      it 'chargeが---だと商品は保存できない' do
        @product.charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Charge Select')
      end

      it 'areaが---だと商品は保存できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Area Select')
      end

      it 'send_dateが---だと商品は保存できない' do
        @product.send_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Send date Select')
      end

      it '価格が299だと保存できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end

      it '価格が10,000,000だと保存できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end

      it '販売価格は全角数字だと保存できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end

      it '販売価格は全角英字だと保存できない' do
        @product.price = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end

      it 'ユーザーが紐付いていないと商品は保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
