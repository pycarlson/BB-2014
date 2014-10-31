module FamilyMemberHelper

  def parse_gender(fm)
    fm.gender.chars.first == ("f" || "F" || "g" || "G") ? "F" : "M"
  end

  def get_family_code(fm)
    Family.find(fm.family_id).code
  end
  
end
