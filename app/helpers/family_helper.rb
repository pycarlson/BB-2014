module FamilyHelper

  def has_been_adopted?
    self.adopted == true
  end

  def get_dl_name(f)
    dl = DropLocation.find(f.drop_location_id)
    dl.drop_location_name
  end

  def order_peeps(f)
    f.family_members.order(:id)
  end

  def family_count(families)
    if families.count == 1
      "#{families.count} Family" 
    elsif families.count > 0
      "#{families.count} Families" 
    else
      "No Familes"
    end 
  end
  
end
