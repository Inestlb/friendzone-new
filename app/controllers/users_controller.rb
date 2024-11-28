class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  
  def index
    @users = User.all # Récupère tous les utilisateurs dans la base
  end

  def edit_mood
  end

  def update_mood
  end

  def edit_vacation
  end

  def update_vacation
  end

  def edit_life_choices
  end

  def update_life_choices
  end

  def new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
