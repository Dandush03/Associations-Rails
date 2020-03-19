class EventsController < ApplicationController
  include SessionsHelper
  def new
    redirect_to root_path if current_user.nil?
    @event = Event.new
  end

  def index
    @past_events = Event.previous
    @present_events = Event.future
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      current_user.event_qries.create(:event_id => @event.id)
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
    @attending = @event.event_qries
  end

  def attend_event
    creator = EventQry.new(user_id: current_user.id, event_id: params[:event_id])
    redirect_to request.referrer if creator.save
  end

  def unattend_event
    creators = current_user.event_qries.where(event_id: params[:event_id]).first
    redirect_to request.referrer if creators.destroy
  end

  def event_params
    params.require(:event).permit(:location, :event_date, :description)
  end
end
