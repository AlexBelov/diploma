class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :github_data_id
      t.integer :primary_language_id
      t.string :full_name
      t.integer :forks
      t.integer :issues
      t.integer :watchers
      t.integer :subscribers
      t.integer :stargazers
      t.boolean :fork, default: false, null: false
      t.timestamps
    end
  end
end
