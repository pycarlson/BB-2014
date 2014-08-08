class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  protected 
  def user_is_admin?
    if current_user && Admin.find_by_user_id(current_user.id) || user_is_super_admin?
      return true
    else
      flash[:alert] = "Sorry. You do not have the correct administrative access to view the page you are trying to access."
      redirect_to root_path
    end
  end

  def user_is_super_admin?
    if current_user && current_user.email == ENV["P_EMAIL"] || current_user && current_user.email == ENV["SUPER_EMAIL"] || current_user && Drive.last.super_admins.include?(SuperAdmin.find_by_user_id(current_user.id))
      return true
    else
      flash[:alert] = "Sorry. You do not have the correct administrative access to view the page you are trying to access."
      redirect_to root_path
    end
  end
end
