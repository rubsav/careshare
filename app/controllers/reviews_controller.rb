class ReviewsController < ApplicationController
  before_filter :load_provider
  
  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @provider.reviews.build(review_params)
    if current_user
      @review.user = current_user
      @review.name = current_user.first_name
      @review.email = current_user.email
    end
    if @review.save
      redirect_to @provider, notice: 'Review created succesfully'
    else
      render 'providers/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(current_user)
  end

  private
  
  def review_params
    params.require(:review).permit(:comment, :provider_id, :name, :email, :type)
  end

  def load_provider
    provider = params[:doctor_id] || params[:counsellor_id] || params[:organization_id] || params[:provider_id]
    @provider = Provider.find(provider)
  end
end
