class ProductBuy
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :area_id, :zipcode, :city, :street, :phone, :building, :token

  with_options presence: true do
    validates :zipcode, format: {
      with: /\A\d{3}-\d{4}\z/,
      message: 'Input correctly'
    }
    validates :user_id
    validates :product_id
    validates :token
    validates :city
    validates :street
    validates :phone, format: {
      with: /\A\d{,11}\z/,
      message: 'Input only number'
    }
  end

  validates :area_id, numericality: { other_than: 1, message: 'Select' }

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)
    Address.create(zipcode: zipcode, area_id: area_id, city: city, street: street, phone: phone, building: building, buy_id: buy.id)
  end
end
