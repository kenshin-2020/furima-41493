class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d+\z/, message: 'must contain only numbers' },
                             length: { in: 10..11, message: 'must be between 10 and 11 digits' }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
