class Match < ApplicationRecord
  belongs_to :first_user, class_name: "User"
  belongs_to :second_user, class_name: "User"

  def matched_user(current_user)
    first_user_id == current_user.id ? second_user : first_user
  end
end
