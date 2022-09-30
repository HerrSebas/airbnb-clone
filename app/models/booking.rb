class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :chekin_date, presence: true
  validates :checkout_date, presence: true
  validate :chekin_date_cannot_be_in_the_past

  def chekin_date_cannot_be_in_the_past

    if chekin_date.present? && chekin_date < Date.today
      errors.add(:chekin_date, "can't be in the past")
    end
  end

end
