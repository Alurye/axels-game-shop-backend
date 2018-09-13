class OrderSerializer < ActiveModel::Serializer
  has_many :game_orders
  has_many :games, through: :games_orders
  attributes :id,:first_name, :last_name, :e_mail,:address, :address_2,:state,:country,:zip_code, :store_id, :order_number
end
