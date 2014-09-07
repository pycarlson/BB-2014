class FamilyMember < ActiveRecord::Base

  belongs_to :family
  belongs_to :drop_location
  belongs_to :family

  has_many :needs, :dependent => :destroy, :inverse_of => :family_member
  accepts_nested_attributes_for :needs, :allow_destroy => true
  
  validates :first_name, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :bio, presence: true

  def get_family_code
    Family.find(self.family_id).code
  end

  def get_gender_pronoun
    self.gender == 'female' ? 'She' : 'He'
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      FamilyMember.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |fm|
        csv << fm.attributes.values_at(*column_names)
      end
    end
  end

end
