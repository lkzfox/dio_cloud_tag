class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      enable_extension('citext')

      t.citext :name
      t.integer :id_user

      t.timestamps
    end

    add_foreign_key :tags, :users, column: :id_user
    add_index :tags, [:name, :id_user], unique: true
  end
end
