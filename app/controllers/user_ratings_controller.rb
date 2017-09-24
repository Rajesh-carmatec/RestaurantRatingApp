class UserRatingsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant
  before_action :authenticate_user!

  def new
    @user_rating = UserRating.new
  end

  def edit
  end

  def create
    @user_rating = UserRating.new(review_params)
    @user_rating.user_id = current_user.id
    @user_rating.restaurant_id = @restaurant.id

    if @user_rating.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def update
    @user_rating.update(review_params)
  end

  def destroy
    @user_rating.destroy
    redirect_to root_path
  end

  private
    def set_review
      @user_rating = params[:id].present? ? UserRating.find(params[:id]) : UserRating.new
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def review_params
      params.require(:user_rating).permit(:aggregate_rating, :rating_text, :rating_color, :votes)
    end
end
