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

  def is_adopting(family)
    false
  end

end
