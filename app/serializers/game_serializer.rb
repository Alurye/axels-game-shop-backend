class GameSerializer < ActiveModel::Serializer
  belongs_to :store
  has_many :game_orders
  has_many :orders, through: :game_orders
  attributes :id, :title, :console, :quantity, :price, :genre, :img, :description, :store_id
end
