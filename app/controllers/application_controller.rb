class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  protected 

  def user_is_admin?
    if user_signed_in? && Drive.last.admins.include?(Admin.find_by_user_id(current_user.id)) || user_signed_in? && user_is_super_admin?
      return true
    else
      flash[:alert] = "You do not have the correct administrative access to view the page you are trying to access."
      redirect_to root_path
    end
  end

  def user_is_admin_or_super_admin?
    user_signed_in? && Drive.last.admins.include?(Admin.find_by_user_id(current_user.id)) || user_is_super_admin?
  end

  def user_is_super_admin?
    if user_signed_in? && Drive.last.super_admins.include?(SuperAdmin.find_by_user_id(current_user.id))
      return true
    else
      flash[:alert] = "You do not have the correct administrative access to view the page you are trying to access."
      redirect_to root_path
    end
  end
end
