class Order < ApplicationRecord
  belongs_to :store
  has_many :game_orders
  has_many :games, through: :game_orders


  validates :first_name, :last_name, presence: true


end
