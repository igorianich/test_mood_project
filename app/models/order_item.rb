class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :music_record

  validates :quantity, numericality: { greater_than: 0 }

end
