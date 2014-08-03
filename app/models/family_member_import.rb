require 'roo' 

class FamilyMemberImport

  ActiveModel::Model

  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file
  
  def initialize(attributes = {}, drive_id = nil)
    attributes.each { |name, value| send("#{name}=", value) }
    @drive = Drive.find(drive_id) if drive_id != nil
    p "*" * 100
    p @drive
    @families = []
  end

  def persisted?
    false
  end
  
  def save
    if imported_family_members.map(&:valid?).all?
      imported_family_members.each(&:save!)
      true
    else
      imported_family_members.each_with_index do |family_member, index|
        family_member.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_family_members
    @imported_family_members ||= load_imported_family_members
  end

  def load_imported_family_members
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      family = Family.find_by_code(row["code"]) || Family.new(code: row["code"])
      family_member = FamilyMember.where("family_id = ? AND first_name = ?", family.id, row["first_name"]).first || FamilyMember.new
      family_member.attributes = row.to_hash.slice(row["code"])
      family_member.first_name = row["first_name"]
      family_member.gender = row["gender"]
      family_member.size_pants = row["size_pants"]
      family_member.size_shirt = row["size_shirt"]
      family_member.size_dress = row["size_dress"]
      family_member.size_shoes = row["size_shoes"]
      family_member.bio = row["bio"]
      family_member.age = row["age"]

      drop_location_id = row["drop_location_id"]
      
      if family_member.save
        check_for_needs(row, family_member)
        create_family_associations(family_member, family, drop_location_id)
      end      
      
      family_member
    end
  end



  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}. Please import '.csv', '.xls', or '.xlsx' file types only."
    end
  end

  def check_for_needs(row, family_member) 
    row.each do |key, value|
      if key.include?("need")
        if value != nil
          need_check = []
          family_member.needs.each do |need|
            need_check << need if need.item == value
          end
          if need_check.length == 0
            need = Need.create(item: value) 
            family_member.needs << need
          end
        end
      end
    end
  end

  def create_family_associations(family_member, family, drop_location_id)
    family_member.family = family
    family.drive = Drive.last
    family.drop_location_id = drop_location_id
    family.save
  end

end
