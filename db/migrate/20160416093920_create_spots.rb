class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.string :url, limit: 2048

      t.timestamps null: false
    end
  end
end
