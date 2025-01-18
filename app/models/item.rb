class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :item_name,      presence: true
  validates :item_text,      presence: true
  validates :category_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shippingfee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :deliveryday_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,          presence: true,
                             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be a number between ¥300 and ¥9,999,999' }

  has_one_attached :image
end
