class ProvidersController < ApplicationController
 

  def index
    @providers =  if params[:search]
      Provider.where("LOWER(first_name) LIKE LOWER(?)", "%#{params[:search]}%")
    else 
      Provider.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @provider = Provider.find(params[:id])
    @review = @provider.reviews.build
    @rating = Rating.where(provider_id: @provider.id).order("created_at DESC")
  end
  
  def new
    @provider = Provider.new
    @type = params[:type]
  end
  
  def create
    @provider = Provider.new(provider_params)
      if @provider.save
        redirect_to @provider, notice: "D.O.C Successfully Added!"
      else
        flash[:message] = "Something did not validate"
        render 'new'
    end
  end
  
  def edit
  end

  def delete
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
