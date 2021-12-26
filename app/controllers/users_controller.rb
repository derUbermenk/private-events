class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit delete]

  def show
    @events_created = @user.events.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
