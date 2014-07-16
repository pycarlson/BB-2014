class Donor < ActiveRecord::Base
  belongs_to :drive
  belongs_to :family
  # belongs_to :drive, :inverse_of => :drop_dates
  belongs_to :drop_date
  has_many :families
  has_one :drop_location

  def get_users_drop_location_name(user)
    DropLocation.find(user.drop_location_id).name
  end

end


