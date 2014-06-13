module ApplicationHelper

  def cp(path)
    "active" if current_page?(path)
  end

  def user_has_chosen_drop_location(user)
    user.drop_location_id != nil
  end

  protected
  def user_is_admin?
    current_user && current_user.email == 'p@me.com' || user_is_super_admin?
  end

  def user_is_super_admin?
    current_user && current_user.email == ENV["P_EMAIL"]
  end
  
end
