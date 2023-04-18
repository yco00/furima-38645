class BuyDelivery
  include ActiveModel::Model
  attr_accessor :postno, :area_id, :cities, :address, :building, :tel, :item_id, :user_id, :token


  with_options presence: true do
    validates :postno , format: { with: /\A[0-9]{3}[-][0-9]{4}\z/,message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :cities
    validates :address
    validates :tel
    validates :user_id
    validates :item_id
    validates :token
  end
    validates :tel, length: { minimum: 10, maximum: 12, message: 'number is too short' }
    validates :tel,numericality: {only_integer: true, message: 'number is only number'}

  def save
    buy = Buy.create(item_id:item_id, user_id: user_id)
    Delivery.create(postno: postno, area_id: area_id, cities: cities, address:address, building: building, tel: tel, buy_id: buy.id)
  end

end