class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :item_name
    validates :introduction
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :prefecture_id
      validates :shipping_cost_id
      validates :shipping_day_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
    validates :image
  end
end
