class AddIndexes < ActiveRecord::Migration
  def change
    add_index :imported_data, :graduated_at
    add_index :addresses, [:addressable_type, :addressable_id]
    add_index :addresses, :addressable_type
    add_index :images, [:imageable_type, :imageable_id]
    add_index :skills, :name
    add_index :languages, :name
  end
end
