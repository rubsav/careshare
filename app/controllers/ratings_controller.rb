class RatingsController < ApplicationController
  before_filter :ensure_logged_in, only: [:create, :destroy]
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
