class AddLimitToPhoneNumberForProvider < ActiveRecord::Migration
  def change
  	change_column :providers, :phone_number, :string, limit: 10
  end
end
