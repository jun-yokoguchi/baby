class SellersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    render "sellers/new"
  end
  
  def show
    @user = User.find(params[:id])
  end
  def seller
    @user = User.find(params[:id])
  end
  
  def home
    @micropost = current_user.microposts.build if user_signed_in?
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user 
    else
      render 'new'
    end
  end
  
  private
  
  def seller_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :nickname, :title, :profile, :homepage, :blog, :twitter, :facebook, :mixi, :image)
  end
end
