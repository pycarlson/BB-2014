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
    Family.where(drop_location_id: user.drop_location_id, is_live: true)
  end

  def self.to_csv(options = {}) 
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |family|
        csv << family.attributes.values_at(*column_names)
      end
    end
  end


end
