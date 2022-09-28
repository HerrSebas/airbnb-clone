class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
  end
  def create
    @booking = Booking.new(booking_params)
    @user = User.find(params[:user_id])
    @booking.user = @user
    if @booking.save
      redirect_to user_bookings_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date, :flat_id)
  end
end
