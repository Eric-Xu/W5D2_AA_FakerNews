class AddAncestorCommenttoComments < ActiveRecord::Migration
  def change
    create_table :comment_ancestries do |t|
      t.integer :descendant_id
      t.integer :ancestor_id

      t.timestamps
    end
    add_index :comment_ancestries, :descendant_id
    add_index :comment_ancestries, :ancestor_id
  end
end
