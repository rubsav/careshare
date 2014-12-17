class RatingsController < ApplicationController
  before_filter :load_provider
 
  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
  #   @rating = Rating.new(rating_params)

  #   if current_user
  #     @rating.user_id = current_user.id
  #   end
    
  #   @rating.provider_id = @provider.id
    
  #   if @rating.save
  #     redirect_to @provider, notice: 'You have successfully added a rating!'
  #   else
  #     render 'providers/show'
  #   end
  # end


   @rating = @provider.ratings.build(rating_params)
    if current_user
      @rating.user = current_user
    end

    if @rating.save
      redirect_to @provider, notice: 'Rating created succesfully'
    else
      render 'providers/show'
    end
  end



  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
  end

  def edit
  end

  private

  def rating_params
    params.require(:rating).permit(:knowledge_rating, :support_rating, :comfort_rating, :accessibility_rating, :recommendation_rating, :provider_id, :user_id, :type)
  end

  def load_provider
    provider = params[:doctor_id] || params[:counsellor_id] || params[:organization_id] || params[:provider_id]
    @provider = Provider.find(provider)
  end

end
