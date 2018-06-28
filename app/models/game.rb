class Game < ApplicationRecord
  belongs_to :store
  has_many :purchases
  has_many :customers, through: :purchases
end
