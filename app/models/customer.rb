class Customer < ApplicationRecord
  belongs_to :store
  has_many :purchases
  has_many :games, through: :purchases
  
end
