module EventsHelper
  def user_attending?
    !Creator.find_by(user_id: current_user.id, event_id: @event.id).nil?
  end

  def event(attend)
    @event = attend.event
  end
end
