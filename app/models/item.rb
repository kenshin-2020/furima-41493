class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shippingfee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :deliveryday_id, numericality: { other_than: 1, message: "can't be blank" }

  has_one_attached :image
end
