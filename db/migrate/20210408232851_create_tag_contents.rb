class CreateTagContents < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_contents do |t|
      t.integer :id_tag, null: false
      t.integer :id_content, null: false

      t.timestamps
    end

    add_foreign_key :tag_contents, :tags, column: :id_tag
    add_foreign_key :tag_contents, :contents, column: :id_content
  end
end
