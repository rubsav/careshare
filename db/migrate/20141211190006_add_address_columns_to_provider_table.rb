class AddAddressColumnsToProviderTable < ActiveRecord::Migration
  def change
  	rename_column :providers, :address, :full_address
  	add_column :providers, :address_line1, :string
  	add_column :providers, :address_line2, :string
  	add_column :providers, :city, :string
  	add_column :providers, :province, :string
  	add_column :providers, :area_code, :string, limit: 6 
  end
end
