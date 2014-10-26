class DropLocation < ActiveRecord::Base

  belongs_to :drive
  belongs_to :adoption
  has_many :families
  has_many :users
  has_many :drop_dates, :dependent => :destroy
  accepts_nested_attributes_for :drop_dates, :allow_destroy => true

  validates :drive_id, 
            :street, 
            :city, 
            :state, 
            :zipcode, 
            :drop_location_name, 
            presence: true
end
