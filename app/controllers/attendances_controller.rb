class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.attendances.create(attend_params)

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
