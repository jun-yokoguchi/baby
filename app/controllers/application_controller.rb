class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#  include SessionsHelper
#  def after_sign_in_path_for(resource)
#        current_user
#  end
  
  private
  def sign_in_required
    redirect_to signup_url unless user_signed_in?
  end
  #def logged_in_user
   # unless user_signed_in?
    #  store_location
     ##redirect_to login_url
    #end
  #end
end
