class Adoption < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
  belongs_to :drive
  has_one :drop_location
  has_one :drop_date

  validates :drive_id, 
            :user_id,
            :first_name,
            :last_name,
            :email,
            :street,
            :city,
            :state,
            :zip,
            :phone,
            presence: true

  before_save :standardise_number
  before_save :convert_drop_date

  def standardise_number
    if self.phone != nil
      self.phone.gsub!(/\D/, "")
      self.phone.gsub!(/(\d{3})(\d{3})(\d{4})/, '\1-\2-\3')
    end
  end

  def convert_drop_date
    if self.drop_location_id == 0
      self.drop_off_date = "staff"
    else
      self.drop_off_date = DropDate.find(self.drop_date_id).date.strftime('%b %d')
    end
  end

  def drop_off
    date_id = User.find(self.user_id).drop_date_id
    DropDate.find(date_id).date
  end

  def self.to_csv
    wanted_columns = [:family_code, :first_name, :last_name, :email, :street, :city, :state, :zip, :phone, :company, :drop_location_name, :drop_off_date, :received_at_org, :given_to_family, :num_boxes]
    CSV.generate do |csv|
      csv << wanted_columns
      all.each do |adoption|
        csv << adoption.attributes.with_indifferent_access.values_at(*wanted_columns)
      end
    end
  end
end
