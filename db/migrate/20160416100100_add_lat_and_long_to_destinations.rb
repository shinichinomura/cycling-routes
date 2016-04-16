class AddLatAndLongToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :latitude, :float, limit: 53, after: :address
    add_column :destinations, :longitude, :float, limit: 53, after: :latitude
  end
end
