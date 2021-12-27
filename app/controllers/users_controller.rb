class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit delete]

  def show
    @created_events = @user.events.all
    @attended_events = @user.attended_events.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
