class AttendancesController < ApplicationController
  def new
    @invitation = Attendance.new
    @events = Event.all
    @users = User.all
  end

  def create
    @invitation = Attendance.new(attendance_params)
    if @invitation.save
      redirect_to root_path, notice: 'User invitated'
    else
      flash.now.alert('Invitation failed')
      render :new
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :attendee_id)
  end
end
