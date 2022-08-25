class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user.id, @comment.post_id)
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
