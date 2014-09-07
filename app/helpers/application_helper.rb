module ApplicationHelper

  def full_title(page_title)
    base_title = "Brighter Beginnings Adopt-a-Family Program"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def go_back_path(family)
    if family.family_members.length >= 5
      families_of_five_or_more_path
    elsif family.family_members.length == 4
      families_of_four_path
    elsif family.family_members.length == 3
      families_of_three_path
    elsif family.family_members.length <=2 
      families_of_two_and_under_path
    end
  end

  def drive_is_closed?
    Drive.last.status == false
  end

  def nav_link(text, path)
    if current_page?(path)
      link_to text, path, class: "active"
    else
      link_to text, path
    end
  end

  protected
  def user_is_admin?
    current_user && Admin.find_by_user_id(current_user.id) || user_is_super_admin?
  end

  def user_is_super_admin?
    current_user && current_user.email == ENV["P_EMAIL"] || current_user && current_user.email == ENV["SUPER_EMAIL"] || current_user && Drive.last.super_admins.include?(SuperAdmin.find_by_user_id(current_user.id))
  end
  
end
