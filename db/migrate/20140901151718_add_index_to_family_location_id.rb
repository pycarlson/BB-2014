class AddIndexToFamilyLocationId < ActiveRecord::Migration
  def change
    add_index :families, :drop_location_id
  end
end
