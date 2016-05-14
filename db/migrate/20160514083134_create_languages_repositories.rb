class CreateLanguagesRepositories < ActiveRecord::Migration
  def change
    create_table :languages_repositories do |t|
      t.integer :language_id
      t.integer :repository_id
      t.integer :loc, limit: 8
    end
  end
end
