class Family < ActiveRecord::Base
  belongs_to :drive
  belongs_to :donor
  belongs_to :user
  belongs_to :adoption
  
  has_many :family_members, :dependent => :destroy, :inverse_of => :family
  
  accepts_nested_attributes_for :family_members, :allow_destroy => true

  validates :code, presence: true

  before_create :strip_family_code

  def strip_family_code
    self.code.strip!
  end

  def self.get_total_adoptions
    total_fams = Family.count
    adopted_families = []
    Family.all.each { |fam| adopted_families << fam if fam.adopted == true }
    @left_unadopted = total_fams - adopted_families.count
  end

  def get_adoptor_phone_number(user_id)
    user = User.find(user_id)
    user.phone
  end

  def drop_off
    date_id = User.find(self.user_id).drop_date_id
    DropDate.find(date_id).date_and_time
  end

  def self.filter_families(user)
    if user.drop_location_id == 0
      families = Family.where(is_live: true)
      families = families.select {|f| f if f.adopted == false}
    else
      families = Family.where(drop_location_id: user.drop_location_id, is_live: true)
      families = families.select {|f| f if f.adopted == false}
    end
  end

  def self.get_fams_five_and_more(families)
    families.select {|f| f if f.family_members.length >= 5 }
  end

  def self.get_fams_four(families)
    families.select {|f| f if f.family_members.length == 4 }
  end

  def self.get_fams_three(families)
    families.select {|f| f if f.family_members.length == 3 }
  end

  def self.get_fams_two(families)
    families.select {|f| f if f.family_members.length == 2 }
  end

  def self.get_fams_one(families)
    families.select {|f| f if f.family_members.length == 1 }
  end

end

