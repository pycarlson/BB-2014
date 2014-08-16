class DropLocation < ActiveRecord::Base

  belongs_to :drive
  has_many :families
  has_many :users
  has_many :drop_dates, :dependent => :destroy
  accepts_nested_attributes_for :drop_dates, :allow_destroy => true

  validates :drive_id, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :drop_location_name, presence: true
end
