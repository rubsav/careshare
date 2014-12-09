class CreateTransCares < ActiveRecord::Migration
  def change
    create_table :trans_cares do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :organization
      t.string :address
      t.string :phone_number
      t.string :wating_period

      t.timestamps
    end
  end
end
