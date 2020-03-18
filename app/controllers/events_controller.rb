class EventsController < ApplicationController
  include SessionsHelper
  def new
    redirect_to root_path if current_user.nil?
    @event = Event.new
  end

  def create
    if current_user.events.create(event_params)
      redirect_to root_path
    else
      render html: @event.errors.inspect.to_s
    end
  end

  def destroy
  end

  def event_params
    params.require(:event).permit(:location, :event_date)
  end
end
