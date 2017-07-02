class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership, only: [:edit, :update, :destroy]

  def index

    @posts = Post.all.order('created_at desc')
    @posts_count = current_user.posts.length
  end

  def new

  end
  def create
    new_post = Post.new(user_id:current_user.id, content: params[:content])
    if new_post.save
      redirect_to '/'
    else
      redirect_to 'new_post_path'
    end
  end
  def edit
    @post=Post.find(params[:id])
  end
  def update
    @post.content = params[:content]
    if @post.save
      redirect_to '/'
    else
      render "edit"
    end
  end
  def destroy
    @post.destroy
    redirect_to '/'
  end
  def followers

  end

  def followings

  end
  def likedusers
    @post=Post.find(params[:id])

  end


  private

  def check_ownership
    @post = Post.find_by(id:params[:id])
    redirect_to root_path unless @post.user_id == current_user.id
  end
end
