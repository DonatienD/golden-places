class BookingsController < ApplicationController
  before_action :find_villa, only: [:new, :create]
  def index
    @bookings = Booking.where(user_id: 2)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(2)
    @booking.villa = @villa
    @booking.user = @user
    @booking.is_accepted = false
    if @booking.save
      redirect_to villa_path(@villa)
    else
      render :new
    end
  end

  private

  def find_villa
    @villa = Villa.find(params[:villa_id])
  end

  def booking_params
    params.require(:booking).permit(:number_of_nights, :date)
  end
end
