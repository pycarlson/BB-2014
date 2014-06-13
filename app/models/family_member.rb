class FamilyMember < ActiveRecord::Base

  belongs_to :family
  belongs_to :drop_location
  
  has_many :needs, :dependent => :destroy, :inverse_of => :family_member
  accepts_nested_attributes_for :needs, :allow_destroy => true

  def self.accessible_attributes
   [:id, :family_id, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :age]
 end

end
