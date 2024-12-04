class EventsController < ApplicationController
  def index
    @events = Event.all
    @matches = Match.all
    @user = current_user
    @user_events = @user.events
  end

  def send_event
    @event = Event.find(params[:id])
    send_event_params[:match_ids].each do |id|
      next if id == ""

      match = Match.find(id)
      Message.create(
        match: match,
        user: current_user,
        content: "I am participating to #{@event.title}, do you want to join me?"
      )
    end
    redirect_to events_path, alert: "Events succesfully shared!"

  end

  private

  def send_event_params
    params.require(:send_event).permit(match_ids: [])
  end
end
