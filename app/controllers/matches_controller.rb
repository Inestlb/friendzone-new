class MatchesController < ApplicationController
  def index
    @matches = Match.where("first_user_id = ? OR second_user_id = ?", current_user.id, current_user.id)
  end
end
