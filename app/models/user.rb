class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname, presence: true
 validates :firstname, presence: true, format: /\A[ぁ-んァ-ン一-龥]+\z/
 validates :lastname, presence: true, format: /\A[ぁ-んァ-ン一-龥]+\z/
 validates :firstnameruby, presence: true, format: /\A[ァ-ヶー－]+\z/
 validates :lastnameruby, presence: true, format: /\A[ァ-ヶー－]+\z/
 validates :birthday, presence: true

 VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates :password, format: { with: VALID_PASSWORD_REGEX }

has_many :items
has_many :comments
has_many :buys

end
