class EventsController < ApplicationController
  def index
    @events = Event.all
    @matches = Match.all
    @user = current_user
    @user_events = @user.events
  end
end
