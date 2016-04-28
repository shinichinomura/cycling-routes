class CreateArticleDestinations < ActiveRecord::Migration
  def change
    create_table :article_destinations do |t|
      t.references :article, index: true, foreign_key: true
      t.references :destination, index: true, foreign_key: true
      t.integer :display_order, null: false, default: 0

      t.timestamps null: false
    end
  end
end
