class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :facebook, default: false, null: false
      t.boolean :linkedin, default: false, null: false
      t.boolean :linkedin_scraped, default: false, null: false
      t.boolean :github, default: false, null: false
      t.boolean :github_scraped, default: false, null: false
      t.boolean :import, default: false, null: false
      t.timestamps
    end
  end
end
