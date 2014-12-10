class ChangeTransCaresToProvider < ActiveRecord::Migration
  def change
  	rename_table :trans_cares, :providers
  end
end
