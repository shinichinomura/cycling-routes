class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :address
      t.text :description

      t.timestamps null: false
    end
  end
end
