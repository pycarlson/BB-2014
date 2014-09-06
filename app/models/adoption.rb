class Adoption < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
  belongs_to :drive
  has_one :drop_location
  has_one :drop_date

  def drop_off
    date_id = User.find(self.user_id).drop_date_id
    DropDate.find(date_id).date_and_time
  end
end
