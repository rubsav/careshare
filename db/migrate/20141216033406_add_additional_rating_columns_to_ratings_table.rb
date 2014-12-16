class AddAdditionalRatingColumnsToRatingsTable < ActiveRecord::Migration
  def change
  	rename_column :ratings, :rating, :knowledge_rating
  	add_column :ratings, :support_rating, :integer
  	add_column :ratings, :comfort_rating, :integer
  	add_column :ratings, :accessibility_rating, :integer
  	add_column :ratings, :recommendation_rating, :integer
  end
end
