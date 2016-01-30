class PostsController < ApplicationController
  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = 1
    if @post.save
      redirect_to sub_url(params[:sub_id])
    else
      fail
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end

  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:posts).permit(:title, :url, :content, :sub_id)
  end
end
