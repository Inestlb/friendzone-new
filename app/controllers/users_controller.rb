class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.where.not(id: current_user)
  end

  def edit_mood
  end

  def update_mood
    @user.update(mood_params)
    redirect_to edit_vacation_user_path(@user)
  end

  def edit_vacation
  end

  def update_vacation
    @user.update(vacation_params)
    redirect_to edit_life_choice_user_path(@user)
  end

  def edit_life_choices
    edit
  end

  def update_life_choice
    @user.update(life_choice_params)
    redirect_to users_path
    # redirect_to user_path(@user)
  end

  def new
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def mood_params
    params.require(:user).permit(:mood)
  end

  def vacation_params
    params.require(:user).permit(:vacation)
  end

  def life_choice_params
    params.require(:user).permit(:life_choice)
  end
end
