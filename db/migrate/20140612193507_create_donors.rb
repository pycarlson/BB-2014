class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.integer :user_id
      t.integer :drive_id
      t.integer :drop_location_id
      t.integer :family_id
      t.string  :first_name
      t.string  :last_name
      t.string  :company
      t.string  :street
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :phone
    end
  end
end
