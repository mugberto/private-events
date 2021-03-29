module EventsHelper
  def attendees
    render 'attendees_list' if @event.attendees
  end

  def attend_event_button
    render 'attend_btn' if current_user
  end
end
