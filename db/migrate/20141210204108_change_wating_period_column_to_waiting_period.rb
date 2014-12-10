class ChangeWatingPeriodColumnToWaitingPeriod < ActiveRecord::Migration
  def change
  	rename_column :trans_cares, :wating_period, :waiting_period
  end
end
