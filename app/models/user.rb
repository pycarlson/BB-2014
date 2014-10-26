class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :drop_date
  belongs_to :drop_location
  has_many :adoptions
  has_many :families

  after_create :update_super_drop_id

  before_save :standardise_number

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def standardise_number
    if self.phone != nil
      self.phone.gsub!(/\D/, "")
      self.phone.gsub!(/(\d{3})(\d{3})(\d{4})/, '\1-\2-\3')
    end
  end

  def remove_as_admin
    if Admin.find_by_user_id(self.id)
      Admin.find_by_user_id(self.id).destroy
    end
  end

  def remove_if_super_admin
    if SuperAdmin.find_by_user_id(self.id)
      SuperAdmin.find_by_user_id(self.id).destroy
    end
  end

  def is_super?
    super_admin = SuperAdmin.find_by_user_id(self.id) 
    if super_admin != nil || self.email == ENV["P_EMAIL"] || self.email == ENV["SUPER_EMAIL"]
      true
    else
      false
    end
  end  

  def self.has_adoptions(user)
    user.adoptions.length > 0
  end

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

  def get_drop_location_name
    unless self.drop_location_id == 0
      DropLocation.find(self.drop_location_id).drop_location_name
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

  def self.to_csv
    wanted_columns = [:first_name, :last_name, :email, :street, :city, :state, :zip, :phone, :company]
    CSV.generate do |csv|
      csv << wanted_columns
      all.each do |adoption|
        csv << adoption.attributes.with_indifferent_access.values_at(*wanted_columns)
      end
    end
  end
end
