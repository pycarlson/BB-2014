class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :drop_date
  belongs_to :drop_location
  has_many :families

  after_create :update_super_drop_id

  def update_super_drop_id
    if self.email == ENV["P_EMAIL"] || self.email == ENV["SUPER"]
      self.drop_location_id = 0
      self.save
    end
  end

  def filter_families
    if self.drop_location_id == 0
      @families = Family.where('is_live = ?', true)
    else
      @families = Family.filter_families(self)
    end
    return @families
  end

  def create_adopted_family_associations(family)
    self.adoptor = true
    family.adopted = true
    family.save
    self.families << family
    UserMailer.adoption_confirmation(self).deliver
    self.save
  end

  def get_drop_location_name
    unless self.drop_location_id == 0
      DropLocation.find(self.drop_location_id).name
    end
  end

  def self.who_have_made_adoptions
    users = []
    User.all.each do |u|
      if u.families.length > 0
        users << u
      end
      users
    end
  end
end
