class Flat < ApplicationRecord
  has_one_attached :photo
  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :category, presence: true

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
