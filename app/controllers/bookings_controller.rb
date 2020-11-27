class BookingsController < ApplicationController
  before_action :find_villa, only: [:new, :create]
  before_action :set_user, only: [:index, :create]
  def index
    @bookings = Booking.where(user_id: @uid)
    @upcoming_bookings = @bookings.select { |booking| booking.date >= Date.today }
    @past_bookings = @bookings.select { |booking| booking.date < Date.today }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(@uid)
    @booking.villa = @villa
    @booking.user = @user
    @booking.is_accepted = false
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def find_villa
    @villa = Villa.find(params[:villa_id])
  end

  def set_user
    @uid = User.where(email: "booking@gmail.com")[0].id
  end

  def booking_params
    params.require(:booking).permit(:number_of_nights, :date)
  end
end
