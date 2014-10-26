class Organization < ActiveRecord::Base

  validates :name, 
            :blurb, 
            :email, 
            :phone, 
            :address, 
            :zip, 
            :website_url, 
            presence: true

  validates :email, 
            :phone,
            :address,
            uniqueness: true

  before_save :standardise_number

  def standardise_number
    if self.phone != nil
      self.phone.gsub!(/\D/, "")
      self.phone.gsub!(/(\d{3})(\d{3})(\d{4})/, '\1-\2-\3')
    end
  end

end
