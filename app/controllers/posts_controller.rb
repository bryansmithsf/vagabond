class PostsController < ApplicationController

  def index
    @users = User.all
    @posts =  Post.all.order(created_at: :desc)
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
    @user = current_user
    @post = Post.create(post_params)
    @user.posts << @post
    @user.posts.order(created_at: :desc)
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:post_id])
    # @user = @post.user.first_name
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
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    flash[:notice]="Post Succesfully Updated!"
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    if current_user
      @post.destroy
      redirect_to posts_path
    else
      flash[:notice]="You are not authorized to delete Posts!"
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:text)
  end
end
