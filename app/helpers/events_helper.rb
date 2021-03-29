module EventsHelper
  def attendees
    render 'attendees_list' if @event.attendees
  end
end
