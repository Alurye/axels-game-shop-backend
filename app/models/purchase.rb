class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :games
end
