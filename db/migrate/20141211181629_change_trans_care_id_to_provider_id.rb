class ChangeTransCareIdToProviderId < ActiveRecord::Migration
  def change
  	rename_column :ratings, :trans_care_id, :provider_id
  	rename_column :reviews, :trans_care, :provider_id
  end
end
