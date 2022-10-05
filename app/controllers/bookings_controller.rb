class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find()
  end

  private

  def booking_params
    params.require(:booking).permit(:chekin_date, :checkout_date)
  end
end
