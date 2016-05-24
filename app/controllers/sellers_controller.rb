class SellersController < ApplicationController
  before_action :authenticate_seller!
  
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
    @micropost = current_user.microposts.build if seller_signed_in?
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
    params.require(:user).permit(:name, :pname, :address, :birthday, :gender, :phone, :postalcode, :image)
  end
end
