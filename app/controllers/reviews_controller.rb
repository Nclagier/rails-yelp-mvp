class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(user_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(restaurant)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
