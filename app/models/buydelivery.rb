class BuyDelivery
  include ActiveModel::Model
  attr_accessor :postno, :area_id, :cities, :address, :building, :tel, :user_id, :buy_id



  def save
    # 寄付情報を保存し、変数donationに代入する
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Delivery.create(postno: postno, area_id: area_id, cities: cities, address:address, building: building, tel: tel, buy_id: buy.id)
  end

end