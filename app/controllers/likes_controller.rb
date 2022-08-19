class LikesController < ApplicationController
  def create
    post_id = params[:post_id]
    author_id = current_user.id
    return if Like.where(post_id:, author_id:).exists?

    like = current_user.likes.new(post_id:, author_id:)
    like.save
    redirect_to request.referrer
  end
end
