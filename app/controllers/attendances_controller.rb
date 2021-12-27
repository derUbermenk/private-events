class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.attendance.create(attend_params)
  end

  private

  def attend_params
    params.require(:attendance).permit(:event_id)
  end
end
