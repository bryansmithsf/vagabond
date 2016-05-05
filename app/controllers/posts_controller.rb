class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end
  def new
    if current_user
      @post = Post.new
      render :new
    else
      flash[:notice]="You are not authorized to create posts!"
      redirect_to posts_path
    end
  end
  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end
  def show
    @post = Post.find(params[:post_id])
    render :show
  end
  def edit
    if current_user
      @post = Post.find(params[:post_id])
      render :edit
    else
      flash[:notice]="You are not authorized to edit posts!"
      redirect_to posts_path
    end
  end
  def update
    @post = Library.find(params[:post_id])
    @post.update(library_params)
    flash[:notice]="Post Succesfully Updated!"
    redirect_to post_path(@post)
  end
  def destroy
    @post = Post.find(params[:post_id])
    if current_user
      @post.destroy
      redirect_to posts_path
    else
      flash[:notice]="You are not authorized to delete libraries!"
      redirect_to posts_path
    end
  end
  private
  def post_params
    params.require(:post).permit(:title,:text)
  end
end
