class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected 
  def user_is_admin?
    current_user && Admin.find_by_user_id(current_user.id) || user_is_super_admin?
  end

  def user_is_super_admin?
    if current_user && current_user.email == ENV["P_EMAIL"] 
    else
      flash[:alert] = "Sorry. You do not have the correct administrative access to view the page you are trying to access."
      redirect_to root_path
    end
  end
end
