class ChangeDatatypeOnProvidersFromStringToText < ActiveRecord::Migration
  def change
    change_column :providers, :first_name, :text
    change_column :providers, :last_name, :text
    change_column :providers, :address_line1, :text
    change_column :providers, :area_code, :text
    change_column :providers, :city, :text
    change_column :providers, :organization_name, :text
    change_column :providers, :phone_number, :text
    change_column :providers, :province, :text
    change_column :providers, :waiting_period, :text
  end
end
