class BuyDelivery
  include ActiveModel::Model
  attr_accessor :postno, :area_id, :cities, :address, :building, :tel, :item_id, :user_id


  with_options presence: true do
    validates :postno , format: { with: /\A[0-9]{3}[-][0-9]{4}\z/ }
    validates :cities
    validates :address
    validates :tel, format: { with: /\A[0-9]{10,11}\z/}
    validates :area_id, numericality: { other_than: 0, message: 'Select' }
    # フォームオブジェクトクラスではアソシエーションを定義できないため、Shippingモデルのbelongs_toと同じバリデーションが必要

  end



  def save
    # 寄付情報を保存し、変数donationに代入する
    buy = Buy.create(item_id:item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Delivery.create(postno: postno, area_id: area_id, cities: cities, address:address, building: building, tel: tel, buy_id: buy.id)
  end

end