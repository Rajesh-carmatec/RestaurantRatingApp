class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def home
  end

  def index
    if params[:criteria].present? || params[:search].present?
      if params[:criteria].eql?("Location")
        get_location_based_results
      else
        @restaurants = Restaurant.search do
          fulltext params[:search]
        end.results
      end  
    else
      @restaurants = Restaurant.all
    end
    @restaurants
  end

  def get_location_based_results
    @locations = Location.search do
      fulltext params[:search]
    end.results
    @restaurants = []
    @locations.collect{ |location|
      @restaurants << location.restaurant
    }
    @restaurants
  end

  def show
    @reviews = UserRating.where(restaurant_id: @restaurant.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:aggregate_rating).round(2)
    end
  end

  def new
    @restaurant = current_user.restaurants.build
  end

  def edit
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:restaurant_id, :name, :cuisines, :currency, :thumb, :has_online_delivery, :is_delivering_now, :has_table_booking)
    end
end