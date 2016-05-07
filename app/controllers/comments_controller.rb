class CommentsController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @post = Post.find(params[:comment_id])
    @comments = @post.comments
    # Post.all(:order=> "created at DESC")
    render :index
  end
  def show
    @city = City.find(params[:city_id])
    @post = Post.find(params[:comment_id])
    @comment = Comment.find(params[:comment_id])
    @user=@comment.user
    render :show
  end
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @city = City.find(params[:city_id])
    if current_user
      render :new
    else
      flash[:notice]="You are not authenticated to create posts for this City!"
      redirect to city_path(@city)
    end
  end
  def create
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_params])
    @comment = Comment.create(comment_params)
    @post.comments << @comment
    # Post.all(:order=> "created at DESC")
    redirect_to city_path(@city)
  end
  def edit
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    if current_user
      render :edit
    else
      flash[:notice]="You are not authorized to edit posts!"
      redirect_to @city
    end
  end
  def update
    @comment = Comment.find(params[:comment_id])
    @comment.update(comment_params)
    @post = Post.find(params[:post_id])
    @city = City.find(params[:city_id])
    flash[:notice]="Comment succesfully updated!"
    redirect_to @city
  end
  def destroy
    @city = City.find(params[:city_id])
    @comment = Comment.find(params[:comment_id])
    if current_user
      @post = Post.find(params[:post_id])
      @post.comments.destroy(@comment)
      flash[:notice]="Succesfully deleted Post!"
      redirect_to @city
    else
      flash[:notice]="You are not authorized to delete Posts!"
      redirect_to @city
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
