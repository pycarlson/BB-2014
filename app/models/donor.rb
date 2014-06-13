class Donor < ActiveRecord::Base
  belongs_to :drive
  belongs_to :family
  # belongs_to :drive, :inverse_of => :drop_dates
end


