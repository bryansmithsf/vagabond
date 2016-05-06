class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end
  def new
    @user = User.new
    render :new
  end
  def create
    @user = User.create(user_params)
    login(@user) # <-- login the user
    redirect_to @user # <-- go to show
  end
  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    render :show
  end
  def edit
    @user = User.find_by_id(params[:id])
    if current_user==@user
      render :edit
    else
      redirect_to users_path
    end
  end
  def update
    @user = User.find_by_id(params[:id])
    if current_user==@user
      @user.update(user_params)
      flash[:notice] = "Successfully Edited!"
      redirect_to @user
    else
      redirect_to users_path
    end
  end
  private
  def user_params #something is broken here
    params.require(:user).permit(:first_name, :last_name, :current_city, :email, :password)
  end
end
