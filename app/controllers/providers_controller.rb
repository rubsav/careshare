class ProvidersController < ApplicationController
 

  def index
    @query = params[:search]

    if @query
      @providers = []
      %w[first_name last_name organization_name].each do |field|
        @providers += Provider.where("LOWER(#{field}) LIKE LOWER(?)", "%#{params[:search]}%") 
      end
      # @providers.sort_by { |provider| provider.organization_name}
    else
      @providers = Provider.all 
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @provider = Provider.find(params[:id])
    @review = @provider.reviews.build
    @rating = Rating.where(provider_id: @provider.id).order("created_at DESC").last
  end
  
  def new
    @provider = Provider.new
    @type = params[:type].capitalize
  end
  
  def create
    @provider = Provider.new(provider_params)
    @provider.user_id = current_user.id
    if @provider.save
      redirect_to @provider, notice: "D.O.C Successfully Added!"
    else
      flash[:message] = "Something did not validate"
      render 'new'
    end
  end
  
  def edit
    @provider = Provider.find(params[:id])
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update_attributes(provider_params)
      redirect_to @provider
    else
      render :edit
    end
    
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
    redirect_to providers_path
  end

private
  def provider_params

    params.require(:provider)
          .permit(:first_name, 
                  :last_name, 
                  :full_address, 
                  :address_line1, 
                  :address_line2, 
                  :city, 
                  :province, 
                  :area_code, 
                  :phone_number, 
                  :type, 
                  :waiting_period,
                  :organization_name,
                  :type,
                  :image
                )
  end

  

end
