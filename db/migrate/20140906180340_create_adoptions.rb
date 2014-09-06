class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.integer :drive_id
      t.integer :user_id
      t.integer :family_id
      t.string :full_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :company
      t.integer :drop_location_id
      t.integer :drop_date_id

      t.timestamps
    end
  end
end
