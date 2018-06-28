class Store < ApplicationRecord
  has_many :games
  has_many :customers
  has_many :purchases, through: :customers
  belongs_to :admin
end
