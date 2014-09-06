class Adoption < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
  belongs_to :drive
  has_one :drop_location
  has_one :drop_date
end
