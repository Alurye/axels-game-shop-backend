class Store < ApplicationRecord
  has_many :games
  has_many :orders
  belongs_to :admin
end
