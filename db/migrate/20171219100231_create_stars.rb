class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :github_data_id
      t.string :repo
      t.timestamps
    end
  end
end
