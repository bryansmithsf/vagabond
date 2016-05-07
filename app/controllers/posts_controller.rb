class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
    render :index
  end
  def new
    if current_user
      @post = Post.new
      @city= City.find(params[:city_id])
      render :new
    else
      flash[:notice]="You are not authorized to create posts!"
      redirect_to posts_path
    end
  end
  def create
    @user = current_user
    @post = Post.create(post_params)
    @city = City.find(params[:city_id])
    @user.posts << @post
    @city.posts << @post
    redirect_to city_path(@city)
  end
  def show
    @post = Post.find(params[:post_id])
    @user = @post.user
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
      flash[:notice]="You are not authorized to delete libraries!"
      redirect_to posts_path
    end
  end
  private
  def post_params
    params.require(:post).permit(:title,:text)
  end
end
