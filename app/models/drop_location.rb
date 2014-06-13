class DropLocation < ActiveRecord::Base

  belongs_to :drive
  has_many :families
  has_many :drop_dates, :dependent => :destroy
  accepts_nested_attributes_for :drop_dates, :allow_destroy => true

end
