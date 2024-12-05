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
        if match.class == Match
          format.json { render(json: { content: "YOUPI", match: match.class == Match, message: "You matched with #{@like.liked.name}", match_id: match.id }) }
        else
          format.json { render(json: { content: "YOUPI", match: match.class == Match, message: "You matched with #{@like.liked.name}" }) }
        end
        format.html { redirect_to users_path, status: :see_other, notice: "You matched with #{@like.liked.name}" }
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

    # Vérifie si un match existe déjà
    existing_match = Match.find_by(
      first_user: mate,
      second_user: current_user
    ) || Match.find_by(
      first_user: current_user,
      second_user: mate
    )

    return existing_match if existing_match # Retourne le match existant si trouvé

    # Vérifie si un "Like" réciproque existe
    if Like.find_by(liker: mate, liked: current_user, is_liked: true)
      return Match.create(first_user: mate, second_user: current_user)
    end

    false # Aucun match n'est créé
  end

end
