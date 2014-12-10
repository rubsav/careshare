class ProvidersController < ApplicationController

  def index
    @provider = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
  end
  
  def new
    @provider = Provider.new
  end
  
  def create
    @provider = Provider.new(provider_params)
      if @provider.save
        redirect_to @provider, notice: "D.O.C Successfully Added!"
      else
        render 'new'
    end
  end

  def edit
  end

  def delete
  end

private
  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :address, :phone_number)
  end

end
