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
    creator = current_user.creators.create(:user_id => @event.user_id, :event_id => @event.id)
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
    if creator.save
      redirect_to request.referrer
    end
  end

  def unattend_event
    creators = current_user.creators.where(:event_id => params[:event_id]).first
    if creators.destroy
      redirect_to request.referrer
    end
  end

  def event_params
    params.require(:event).permit(:location, :event_date, :description)
  end
end
