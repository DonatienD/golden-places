class VillasController < ApplicationController
  def home
    @villa = Villa.new
  end

  def new
    @villa = Villa.new
  end

  def create
    @villa = Villa.new(villa_params)
    @user = User.find(params[:villa][:user_id])
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

  def villa_params
    params.require(:villa).permit(:description, :location, :services, :price_per_night, :number_of_bedrooms, :number_of_bathrooms, :number_of_beds)
  end
end
