class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update]
  before_action :correct_user, only:[:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @micropost = Micropost.new
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def seller
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  def home
    @micropost = current_user.microposts.build if logged_in?
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @following_users = @user.following_users
  end
  def followers
    @user = User.find(params[:id])
    @follower_users = @user.follower_users
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user , notice:'プロフィールを更新しました'
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :nickname, :title, :profile, :homepage, :blog, :twitter, :facebook, :mixi, :image)
  end
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
