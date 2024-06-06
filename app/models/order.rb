class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :music_records, through: :order_items

  enum status: { pending: 0, approved: 1 }
end
