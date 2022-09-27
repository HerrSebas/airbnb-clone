class Flat < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :category, presence: true
end
