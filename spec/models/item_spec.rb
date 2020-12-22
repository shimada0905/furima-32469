require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it '必要な情報を適切に入力すると商品の出品ができること' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいくとき' do
      it 'item_nameが空だと出品ができないこと' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'introductionが空と登録できないこと' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'category_idが空だと出品できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it 'category_idが---だと出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'condition_idが空だと出品できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end

      it 'condition_idが---だと出品できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it 'shipping_cost_idが空だと出品できないこと' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", 'Shipping cost is not a number')
      end

      it 'shipping_cost_idが---だと出品できないこと' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end

      it 'prefecture_idが空だと出品できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it 'prefecture_idが---だと出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'shipping_day_idが空だと出品できないこと' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", 'Shipping day is not a number')
      end

      it 'shipping_day_idが---だと出品できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end

      it 'priceが空だと出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空だと出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが¥300未満だと出品できないこと' do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが¥9999999より大きいと出品できないこと' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceは全角数字では出品できないこと' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '半角英数混合では登録できないこと' do
        @item.price = '1a2b3c'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '半角英語だけでは登録できないこと' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは少数を含む場合出品できないこと' do
        @item.price = 100.3
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'userが紐づいていないと出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
