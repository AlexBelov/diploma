class CreateGithubData < ActiveRecord::Migration
  def change
    create_table :github_data do |t|
      t.integer :user_id
      t.string :login
      t.string :name
      t.string :email
      t.integer :num_repos
      t.integer :num_gists
      t.integer :num_followers
      t.integer :num_following
      t.string :blog
      t.timestamps
    end
  end
end
