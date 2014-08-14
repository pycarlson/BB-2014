class CreateDropLocations < ActiveRecord::Migration
  def change
    create_table :drop_locations do |t|
      t.integer  :drive_id
      t.string   :street
      t.string   :city
      t.string   :state
      t.string   :zipcode
      t.string   :drop_location_name

      t.timestamps
    end
  end
end
