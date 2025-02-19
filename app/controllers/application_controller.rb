class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :name, :age, :friends_age, :friends_distance, :avatar_url])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :friends_age, :friends_distance, :avatar_url])
  end

  def after_sign_up_path(resources)
    edit_mood_user_path(current_user)
  end

  def after_sign_in_path_for(resource)
    edit_mood_user_path(current_user)
  end
end
