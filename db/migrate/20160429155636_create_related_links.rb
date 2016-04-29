class CreateRelatedLinks < ActiveRecord::Migration
  def change
    create_table :related_links do |t|
      t.references :destination, index: true, foreign_key: true
      t.string :url, null: false
      t.string :title
      t.text :description
      t.integer :display_order, null: false, default: 0

      t.timestamps null: false
    end
  end
end
