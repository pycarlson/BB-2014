class Drive < ActiveRecord::Base
  has_many :donors
  has_many :admins
  has_many :super_admins
  has_many :families
  has_many :drop_locations
  has_many :admins

  accepts_nested_attributes_for :drop_locations
end
