# db/migrate/20250521080322_add_rated_at_to_ratings.rb
class AddRatedAtToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :rated_at, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end