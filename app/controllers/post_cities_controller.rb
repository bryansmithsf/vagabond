class PostCitiesController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @posts = @City.posts
    @city.posts.order(created_at: :desc)
    render :index
  end
  def show
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @user = @post.user
    # @comments = @post.comments
    render :show
  end
  def new
    @post = Post.new
    @city = City.find(params[:city_id])
    if current_user
      render :new
    else
      flash[:notice]="You are not authenticated to create posts for this City!"
      redirect_to city_path(@city)
    end
  end
  def create
    @city = City.find(params[:city_id])
    @post = Post.create(post_params)
    @user = current_user
    @city.posts << @post
    @user.posts << @post
    @city.posts.order(created_at: :desc)
    redirect_to city_path(@city)
  end
  def edit
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @user = @post.user
    if current_user==@user
      render :edit
    else
      flash[:notice]="You are not authorized to edit posts!"
      redirect_to @city
    end
  end
  def update
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    @city = City.find(params[:city_id])
    flash[:notice]="Post succesfully updated!"
    redirect_to @city
  end
  def destroy
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @user = @post.user
    if current_user==@user
      @city.posts.destroy(@post)
      flash[:notice]="Succesfully deleted Post!"
      redirect_to city_path(@city.id) 
    else
      flash[:notice]="You are not authorized to delete Posts!"
      redirect_to @city
    end
  end
  private
  def post_params
    params.require(:post).permit(:title,:text)
  end
end
