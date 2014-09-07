class Adoption < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
  belongs_to :drive
  has_one :drop_location
  has_one :drop_date

  validates :drive_id, 
            :user_id,
            :family_id,
            :first_name,
            :last_name,
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

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |adoption|
        csv << adoption.attributes.values_at(*column_names)
      end
    end
  end
end
