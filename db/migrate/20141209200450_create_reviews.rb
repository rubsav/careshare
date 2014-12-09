class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :user_id
      t.integer :trans_care

      t.timestamps
    end
  end
end
