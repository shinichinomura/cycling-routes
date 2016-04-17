class AddPhotoToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :photo, :string, after: :description
  end
end
