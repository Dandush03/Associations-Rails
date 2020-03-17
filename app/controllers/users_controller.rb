class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
      redirect_to root_path
    else
      respond_to do |f|
        f.html { render :new }
        f.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    if current_user.nil? 
      (redirect_to login_path) 
    else
      @past_events = Event.where("user_id = #{current_user.id} AND event_date > 02/02/2020")
      @present_evets = Event.where("user_id = #{current_user.id} AND event_date <= 02/02/2020")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :token)
  end
end
