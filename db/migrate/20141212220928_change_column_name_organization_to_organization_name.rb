class ChangeColumnNameOrganizationToOrganizationName < ActiveRecord::Migration
  	def change
  		rename_column :providers, :organization, :organization_name
  	end
end
