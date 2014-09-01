class AddIndexToFamilyCode < ActiveRecord::Migration
  def change
    add_index :families, :code, unique: true
  end
end
