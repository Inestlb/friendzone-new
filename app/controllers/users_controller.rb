class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user) # Récupère tous les utilisateurs dans la base
  end

  def new
  end

end
