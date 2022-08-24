class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.order(id: :desc)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:success] = 'Post created succesfully'
      redirect_to user_posts_path(current_user.id)
    else
      flash[:error] = 'It occur an error when creating the post'
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
