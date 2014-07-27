class FamilyMember < ActiveRecord::Base

  belongs_to :family
  belongs_to :drop_location
  belongs_to :family

  has_many :needs, :dependent => :destroy, :inverse_of => :family_member
  accepts_nested_attributes_for :needs, :allow_destroy => true
  
  # after_save :update_family_member_number

  def update_family_member_number
    family = Family.find(self.family_id)
    family.members = family.family_members.count
    family.save
  end

  def get_family_code
    Family.find(self.family_id).code
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      FamilyMember.create! row.to_hash
    end
  end

end
