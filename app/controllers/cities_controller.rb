class CitiesController < ApplicationController
  def index
    @cities = City.all
    render :index
  end

  def new
    if current_user
      @city = City.new
      render :new
    else
      flash[:notice]="You are not authorized to create cities!"
      redirect_to cities_path
    end
  end

  def create
    @city = City.create(city_params)
    redirect_to cities_path
  end

  def show
    @city = City.find(params[:city_id])
    @posts = @city.posts.order(created_at: :desc)
    render :show
  end

  def edit
    if current_user
      @city = City.find(params[:city_id])
      render :edit
    else
      flash[:notice]="You are not authorized to edit cities!"
      redirect_to cities_path
    end
  end

  def update
    @city = City.find(params[:city_id])
    @city.update(city_params)
    flash[:notice]="City Succesfully Updated!"
    redirect_to city_path(@city)
  end

  def destroy
    @city = City.find(params[:city_id])
    if current_user
      @city.destroy
      redirect_to cities_path
    else
      flash[:notice]="You are not authorized to delete cities!"
      redirect_to cities_path
    end
  end

  private
  def city_params
    params.require(:city).permit(:name,:image)
  end
end
