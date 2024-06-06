class MusicRecord < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :photo, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :damage_assessment, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
