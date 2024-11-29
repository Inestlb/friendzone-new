class LikesController < ApplicationController
  def create

    # @user = User.find(params[:user_id])
    @like = Like.new(
      liker: current_user,
      liked: User.find(params[:liked]),
      is_liked: params[:is_liked]
    )

    if @like.save
      match = check_for_match(@like) if @like.is_liked
      respond_to do |format|
        format.json { render(json: { content: "YOUPI", match: match, message: "You matched with #{@like.liked.name}!" }) }
        format.html { redirect_to users_path, status: :see_other, notice: "You matched with #{@like.liked.name}!" }
      end
    else
      respond_to do |format|
        format.json { render(json: { status: @like }) }
        format.html { redirect_to users_path, status: :see_other, notice: match_message(@like) }
      end
    end

  end

  private

  def check_for_match(like)
    mate = User.find(like.liked_id)
    if Like.find_by(liker: mate, liked: current_user, is_liked: true)
      Match.create(first_user: mate, second_user: current_user)
      return true
    else
      return false
    end
  end

end
