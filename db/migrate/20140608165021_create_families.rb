class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer  :drive_id
      t.boolean  :adopted, :default => false
      t.string   :code
      t.integer  :drop_location_id
      t.boolean  :is_live,  :default => false
      t.integer  :adoption_id

      t.timestamps
    end
  end
end
