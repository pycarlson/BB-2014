class DropDate < ActiveRecord::Base
  belongs_to :drop_location, :inverse_of => :drop_dates
  # belongs_to :drive, :inverse_of => :drop_dates
end


