class RatingsController < ApplicationController
  before_filter :load_provider
  before_filter :ensure_logged_in
  before_filter :load_rating, only:[:show, :destroy, :edit, :update]
 
  def show

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
    @rating.destroy
  end

   def edit
    @rating = Rating.find(params[:id])
  end

  def update
      if @rating.update_attributes(rating_params)
        redirect_to @provider
      else
        render :edit
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:knowledge_rating, :support_rating, :comfort_rating, :accessibility_rating, :recommendation_rating, :provider_id, :user_id, :type)
  end

  def load_provider
    provider = params[:doctor_id] || params[:counsellor_id] || params[:organization_id] || params[:provider_id]
    @provider = Provider.find(provider)
  end

  def load_rating
    @rating = Rating.find(params[:id])
  end

end
