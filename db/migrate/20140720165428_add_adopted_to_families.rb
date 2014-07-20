class AddAdoptedToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :adopted, :boolean, default: :false
  end
end
