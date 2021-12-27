class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.attendances.create(attend_params)

    # destroy the invite if the linke is coming from an invite 
    Invitation.find(params[:invitation_id]).destroy

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def attend_params
    params.permit(:event_id)
  end
end
