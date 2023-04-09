class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shippingday

  validates :category_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :condition_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  validates :postage_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  validates :area_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :shippingday_id, numericality: { other_than: 1 } 
  validates :shippingday_id, numericality: { other_than: 1 , message: "can't be blank"}

end