class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    c = user.bookings.find { |booking| booking.flat_id == record.flat.id }
    if c.present? && c.checkout_date < Date.today
      true
    else
      false
    end
  end

  def new?
    true
  end
end
