class AddEmailAndNameToReview < ActiveRecord::Migration
  def change
  	add_column :reviews, :name, :string
  	add_column :reviews, :email, :string
  end
end
