class AddPhotoToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :photo, :string, after: :description
  end
end
