class TransCaresController < ApplicationController

  def show
    @provider = TransCare.all
  end
  
  def new
    @provider = TransCare.new
  end
  
  def create
    @provider = Trans_care.new(trans_care_params)
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
  def trans_care_params
    params.require(:trans_care).permit(:first_name, :last_name, :address, :phone_number)
  end

end
