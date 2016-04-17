class AddLatAndLongToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :latitude, :float, limit: 53, after: :url
    add_column :spots, :longitude, :float, limit: 53, after: :latitude
  end
end
