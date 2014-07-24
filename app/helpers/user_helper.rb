module UserHelper

  def user_has_chosen_drop_location(user)
    user.drop_location_id != nil
  end

  def family_has_been_adopted?(f)
    f.adopted == true
  end

  def is_adopting(family)
    false
  end

end
