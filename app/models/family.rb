class Family < ActiveRecord::Base
  belongs_to :drive
  belongs_to :donor
  belongs_to :user
  has_many :family_members, :dependent => :destroy, :inverse_of => :family
  
  accepts_nested_attributes_for :family_members, :allow_destroy => true

  def drop_off
    date_id = User.find(self.user_id).drop_date_id
    DropDate.find(date_id).date_and_time
  end

  def self.filter_families(user)
    Family.where(drop_location_id: user.drop_location_id, is_live: true, user_id: nil)
  end

end

