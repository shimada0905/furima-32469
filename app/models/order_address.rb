class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:post_code,:prefecture_id,:city,:house_number,:building_name,:tel,:order_id

  def save
    
  end
end