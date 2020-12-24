require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品の購入がうまくいくとき' do
      it '必要な情報を適切に入力すると商品の購入ができること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも商品の購入ができること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end

      it 'telが11桁以内なら商品の購入ができること' do
        @order_address.tel = "09012345678"
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入がうまくいかない時' do
      it 'post_coseが空だと購入に失敗すること' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it 'post_codeにハイフンが含まれない場合購入に失敗すること' do
        @order_address.post_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが空だと購入に失敗すること' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it 'prefectureが---だと登録できまいこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空だと購入に失敗すること' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入に失敗すること' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telが空だと購入に失敗すること' do
        @order_address.tel = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telがにハイフンが含まれると購入に失敗すること' do
        @order_address.tel = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが全角数字だと購入に失敗すること' do
        @order_address.tel = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
      
      it 'telが11桁以上だと購入に失敗すること' do
        @order_address.tel = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end

      it 'tokenが空だと購入に失敗すること' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
