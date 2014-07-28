class Drive < ActiveRecord::Base
  has_many :admins, :dependent => :destroy
  has_many :super_admins
  has_many :families, :dependent => :destroy
  has_many :drop_locations, :dependent => :destroy

  accepts_nested_attributes_for :drop_locations
  
  # before_save :delete_the_past_drive_families!
  # before_save :delete_the_past_drive!
  
  # def delete_the_past_drive!
  #   if Drive.all.length != 0 
  #     Drive.last.destroy
  #   end
  # end

  # def delete_the_past_drive_families!
  #   Family.all.each do |f|
  #     p "deleting a family"
  #     f.destroy
  #   end
  # end
end
