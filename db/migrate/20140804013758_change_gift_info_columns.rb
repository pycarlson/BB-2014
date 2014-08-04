class ChangeGiftInfoColumns < ActiveRecord::Migration
  def change
    change_column :families, :received_at_org, :date
    change_column :families, :given_to_family, :date
  end
end
