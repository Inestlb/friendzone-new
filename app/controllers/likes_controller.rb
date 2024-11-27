class LikesController < ApplicationController
  def create

    # @user = User.find(params[:user_id])
    @like = Like.new(
      liker: current_user,
      liked: User.find(params[:liked])
    )

    if @like.save
      respond_to do |format|
        format.json { render(json: { content: "Youpi" }) }
        format.html { redirect_to users_path, status: :see_other, notice: "You matched with #{@like.liked.name}!" }
      end
    else
      respond_to do |format|
        format.json { render(json: { status: @like }) }
        format.html { redirect_to users_path, status: :see_other, notice: match_message(@like) }
      end
    end

  end


end
