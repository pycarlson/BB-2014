class DropDate < ActiveRecord::Base
  belongs_to :drop_location, :inverse_of => :drop_dates
  belongs_to :adoption
  has_many :users

  validates :date, :start_time, :end_time, presence: true
  validates :drop_location_id, presence: true

end


