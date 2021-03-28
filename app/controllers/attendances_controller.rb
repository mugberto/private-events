class AttendancesController < ApplicationController
  def new
    @invitation = Attendance.new
    @events = Event.all
    @users = User.all
  end

  def create
    @invitation = Attendance.new(attendance_params)
    if @invitation.save
      redirect_to root_path, notice: 'User invited'
    else
      redirect_to new_attendance_path, alert: 'Invatation failed'
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :attendee_id)
  end
end
