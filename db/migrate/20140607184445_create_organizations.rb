class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string   :name
      t.text     :blurb
      t.string   :email
      t.string   :phone
      t.string   :address
      t.string   :zip
      t.string   :website_url

      t.timestamps
    end
  end
end
