class Order < ApplicationRecord
  belongs_to :store
  has_many :purchases
  has_many :games, through: :purchases


  validates :first_name, :last_name, presence: true


end
