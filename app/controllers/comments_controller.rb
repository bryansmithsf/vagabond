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
    @comment = Post.comments.find(params[:comment_id])
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
      flash[:notice]="You are not authenticated to create comments for this City!"
      redirect to city_post_path(@city,@post)
    end
  end
  def create
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @post.comments << @comment
    # Post.all(:order=> "created at DESC")
    redirect_to city_post_path(@city,@post)
  end
  def edit
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    if current_user
      render :edit
    else
      flash[:notice]="You are not authorized to edit comments!"
      redirect_to city_post_path(@city,@post)
    end
  end
  def update
    @post = Post.find(params[:post_id])
    @city = City.find(params[:city_id])
    @comment = Comment.find(params[:comment_id])
    @comment.update(comment_params)
    flash[:notice]="Comment succesfully updated!"
    redirect_to city_post_path(@city,@post)
  end
  def destroy
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    if current_user
      @post.comments.destroy(@comment)
      flash[:notice]="Succesfully deleted Post!"
      redirect_to city_post_path(@city,@post)
    else
      flash[:notice]="You are not authorized to delete Posts!"
      redirect_to city_post_path(@city,@post)
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
