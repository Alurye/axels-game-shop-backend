class Admin < ApplicationRecord
  has_one :store

  has_secure_password



  has_many :games, through: :store
  has_many :orders, through: :store

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true


end
