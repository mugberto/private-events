class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    if session[:user_id]
      render 'new'
    else
      redirect_to root_path, notice: 'Log in to create events'
    end
  end

  def create
    @user = User.find(session[:user_id])
    @event = @user.events.build(event_params)
    if @event.save
      redirect_to root_path, notice: 'Event created successively'
    else
      flash.now.alert 'Event creation failed'
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :venue)
  end
end
