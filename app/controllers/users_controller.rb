class UsersController < ApplicationController
  def show
    @events_created = User.events.all
  end
end
