require 'date'

class Drive < ActiveRecord::Base
  has_many :admins, :dependent => :destroy
  has_many :super_admins
  has_many :families, :dependent => :destroy
  has_many :drop_locations, :dependent => :destroy
  has_many :adoptions

  accepts_nested_attributes_for :drop_locations

  validates :year, presence: true
  validates :blurb, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  after_create :delete_the_past_drive_families!
  after_create :delete_the_past_drive!
  after_create :delete_the_past_drive_adoptions!
  
  def countdown
    today = Date.today.yday
    halloween = Date.new(2014,11,8).yday
    return (halloween - today)
  end

  def delete_the_past_drive!
    if Drive.all.length > 1 
      Drive.first.destroy
    end
  end

  def delete_the_past_drive_families!
    Family.all.each do |f|
      f.destroy
    end
  end

  def delete_the_past_drive_adoptions!
    User.all.each do |u|
      u.families.clear
    end
  end
end
