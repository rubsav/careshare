class ReviewsController < ApplicationController
  before_filter :load_provider
  
  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @provider.reviews.build(review_params)
    if current_user
      @review.user = current_user
    end
    if @review.save
      redirect_to @provider, notice: 'Review created succesfully'
    else
      render 'providers/show'
    end
  end

  def edit
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  
  def review_params
    params.require(:review).permit(:comment, :provider_id, :name, :email)
  end

  def load_provider
    @provider = Provider.find(params[:provider_id])
  end
end
