class InvitationsController < ApplicationController
  def new
    @users = User.all_except(current_user)
    @event = Event.find(params[:event_id])
    @invited_users = @event.invited_users
  end

  def create
    current_user.invitations_sent.create(create_params)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def create_params
    params.require(:invitation).permit(:invitee_id, :event_id)
  end
end
