class UsersController < ApplicationController
  def index
    @users = User.all # Récupère tous les utilisateurs dans la base
  end

  def new
  end
end
