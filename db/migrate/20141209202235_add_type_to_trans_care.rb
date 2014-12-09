class AddTypeToTransCare < ActiveRecord::Migration
  def change
  	add_column :trans_cares, :type, :string  
  end
end
