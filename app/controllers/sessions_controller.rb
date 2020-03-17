class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper
  def new
    redirect_to root_path unless current_user.nil?
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user.nil?
      flash[:danger] = []
      flash.now[:danger] << 'Invalid name or user does not exist'
      render 'new'
    else
      log_in user
      remember user
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
