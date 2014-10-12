class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.integer  :drive_id
      t.integer  :user_id
      t.integer  :family_id
      t.integer  :drop_location_id
      t.integer  :drop_date_id
      t.string   :family_code
      t.string   :drop_location_name
      t.string   :drop_off_date
      t.date     :received_at_org
      t.date     :given_to_family
      t.integer  :num_boxes, default: 0
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :street
      t.string   :city
      t.string   :state
      t.string   :zip
      t.string   :phone
      t.string   :company
      t.timestamps
    end
  end
end
