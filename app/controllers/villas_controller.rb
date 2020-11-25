class VillasController < ApplicationController
  before_action :set_user, only: [:create]

  def home
    @villa = Villa.new
  end

  def new
    @villa = Villa.new
  end

  def create
    @villa = Villa.new(villa_params)
    @user = User.find(@uid)
    @villa.user = @user
    if @villa.save
      redirect_to villa_path(@villa)
    else
      render :new
    end
  end

  def search
  end

  def search_results
  end

  def show
    @villa = Villa.find(params[:id])
  end

  private
  def set_user
    @uid = User.where(email: "hello@gmail.com")[0].id
  end

  def villa_params
    params.require(:villa).permit(:description, :location, :services, :price_per_night, :number_of_bedrooms, :number_of_bathrooms, :number_of_beds, photos: [])
  end
end
