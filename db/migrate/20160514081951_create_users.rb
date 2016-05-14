class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :facebook_data_id
      t.integer :linkedin_data_id
      t.integer :github_data_id
    end
  end
end
