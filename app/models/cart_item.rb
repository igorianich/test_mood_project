class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :music_record

  validates :quantity, numericality: { greater_than: 0 }
end