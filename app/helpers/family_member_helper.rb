module FamilyMemberHelper

  def parse_gender(fm)
    p fm.gender
    if fm.gender.chars.first == "f" || fm.gender.chars.first == "F" || fm.gender.chars.first == "g" || fm.gender.chars.first == "G"
      return "F"
    else
      return "M"
    end
  end

  def get_family_code(fm)
    Family.find(fm.family_id).code
  end
  
end
