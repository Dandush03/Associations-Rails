class EventsController < ApplicationController
  include SessionsHelper
  def new
    redirect_to root_path if current_user.nil?
    @event = Event.new
  end

  def index
    @past_events = Event.where('event_date < ?', DateTime.now)
    @present_events = Event.where('event_date >= ?', DateTime.now)
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.save
      redirect_to root_path
    else
      respond_to do |f|
        f.html { render :new }
        f.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    @attending = @event.creators
  end

  def attend_event
    creator = Creator.new(:user_id => current_user.id, :event_id => params[:event_id])
    creator.save
  end

  def destroy
  end

  def event_params
    params.require(:event).permit(:location, :event_date, :description)
  end
end
