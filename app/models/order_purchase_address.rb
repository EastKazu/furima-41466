class OrderPurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :order_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Please include a hyphen in the postal code. (e.g., 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Please enter a valid phone number using only 10 or 11 digits without any hyphens." }
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    PurchaseAddress.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      street: street, 
      building_name: building_name, 
      phone_number: phone_number, 
      order_id: order.id
    )
  end
end