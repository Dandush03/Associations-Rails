class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    unless user.nil?
      render html: user.inspect.to_s
      log_in user
      remember user
      redirect_to users_show_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end