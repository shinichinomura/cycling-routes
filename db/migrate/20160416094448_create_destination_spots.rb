class CreateDestinationSpots < ActiveRecord::Migration
  def change
    create_table :destination_spots do |t|
      t.references :destination, index: true, foreign_key: true
      t.references :spot, index: true, foreign_key: true
      t.integer :priority, default: 0

      t.timestamps null: false
    end
  end
end
