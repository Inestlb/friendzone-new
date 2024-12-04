class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.where.not(id: current_user)
    liked_users = User.joins(:likes_as_liked).where(likes_as_liked: { liker: current_user })
    @users -= liked_users
    @users = current_user.suggested_profiles
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

  def suggestions
    current_user.suggested_profiles
  end

  # def likes
  #   @liked_user = User.find(params[:id])
  #   current_user.likes_given.create(liked_id: @liked_user.id)

  #   respond_to do |format|
  #     format.html { redirect_to users_path, notice: "Vous avez aimé #{@liked_user.name} !" }
  #     format.json { render json: { status: 'success', liked_user: @liked_user } }
  #   end
  #end

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
