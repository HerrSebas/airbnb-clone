class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end
  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date)
  end
end
