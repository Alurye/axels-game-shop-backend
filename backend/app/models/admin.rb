class Admin < ApplicationRecord
  has_one :store
  has_many :games, through: :store
  has_many :customers, through: :store
end
