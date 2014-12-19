class ReviewsController < ApplicationController
  before_filter :load_provider
  before_filter :load_review, only:[:show, :edit, :update, :destroy]
  
  def show
    
  end

  def create
    @review = @provider.reviews.build(review_params)
    if current_user
      @review.user = current_user
      @review.name = current_user.first_name
      @review.email = current_user.email
    end
    respond_to do |format|
      if @review.save
        format.html {redirect_to provider_path(@provider.id), notice: 'Review added successfully.' }
        format.js {} # This will look for app/views/reviews/create.js.erb
      else
        format.html {render 'providers/show', alert: 'There was an error.' }
        format.js {} # This will look for app/views/reviews/create.js.erb
      end
    end
  end

  def edit
    
  end

  def update
      if @review.update_attributes(review_params)
        redirect_to user_path(current_user)
      else
        render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(current_user)
  end

  private
  
  def review_params
    params.require(:review).permit(:comment, :provider_id, :name, :email)
  end

  def load_provider
    provider = params[:doctor_id] || params[:counsellor_id] || params[:organization_id] || params[:provider_id]
    @provider = Provider.find(provider)
  end

  def load_review
    @review = Review.find(params[:id])
  end
end
