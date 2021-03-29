class AttendancesController < ApplicationController
  def new
    @invitation = Attendance.new
    @events = Event.all
    @users = User.all
  end

  def create
    @invitation = Attendance.new(attendance_params)
    if @invitation.save
      redirect_to event_path(attendance_params[:event_id]), notice: 'User invited'
    else
      flash[:alert] = "Invatation failed #{@invitation.errors.first}"
      redirect_to event_path(attendance_params[:event_id])
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :attendee_id)
  end
end
