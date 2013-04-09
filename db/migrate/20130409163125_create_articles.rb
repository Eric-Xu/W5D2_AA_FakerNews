class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :url
      t.integer :karma
      t.integer :author_id

      t.timestamps
    end
    add_index :articles, :title
    add_index :articles, :author_id
  end
end
