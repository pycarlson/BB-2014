class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :drive_id
      t.boolean :adopted, default: :false
      t.date    :received_at_org, :date
      t.date    :given_to_family, :date
      t.string  :code
      t.integer :drop_location_id
      t.integer :donor_id
      t.integer :num_boxes, :integer, :default => 0
      t.integer :drop_date_id
      t.boolean :is_live,  :default => false
      t.integer :user_id

      t.timestamps
    end
  end
end
