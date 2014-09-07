class Adoption < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
  belongs_to :drive
  has_one :drop_location
  has_one :drop_date

  validates :drive_id, 
            :user_id,
            :family_id,
            :full_name,
            :email,
            :street,
            :city,
            :state,
            :zip,
            :phone,
            :company,
            presence: true

  before_save :standardise_number

  def standardise_number
    if self.phone != nil
      self.phone.gsub!(/\D/, "")
      self.phone.gsub!(/(\d{3})(\d{3})(\d{4})/, '\1-\2-\3')
    end
  end

  def drop_off
    date_id = User.find(self.user_id).drop_date_id
    DropDate.find(date_id).date_and_time
  end
end
