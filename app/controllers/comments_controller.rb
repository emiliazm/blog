class CommentsController < ApplicationController
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
      flash[:success] = 'Comment created succesfully'
      redirect_to user_post_path(current_user.id, @comment.post_id)
    else
      flash[:error] = 'An error occured when creating the comment'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
