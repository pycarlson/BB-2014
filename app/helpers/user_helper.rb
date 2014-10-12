module UserHelper

  def user_has_chosen_drop_location
    current_user.drop_location_id != nil
  end

  def user_is_a_donor?
    current_user.families.length > 0
  end

  def family_has_been_adopted?(f)
    f.adopted == true
  end

  def get_user_dl_name(user)
    if user.drop_location_id == nil || user.drop_location_id == 0
      nil
    else
      DropLocation.find(user.drop_location_id).drop_location_name
    end
  end

  def unique_users(adoptions)
    users = []
    adoptions.all.each do |a|
      u = User.find(a.user_id)
      users << u unless users.include?(u)
    end
    return users
  end
  
end
