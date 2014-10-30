module FamilyMemberHelper

  def parse_gender_on_index(fm)
    fm.gender.chars.first == ("f" || "F" || "g" || "G") ? "F" : "M"
  end

  def parse_gender_on_show(fm)
    fm.gender.chars.first == ("f" || "F" || "g" || "G") ? "girl" : "boy"
  end

  def get_family_code(fm)
    Family.find(fm.family_id).code
  end
  
end
