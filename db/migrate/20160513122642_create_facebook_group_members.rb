class CreateFacebookGroupMembers < ActiveRecord::Migration
  def change
    create_table :facebook_group_members do |t|
      t.string :name
      t.string :original_name
      t.string :facebook_id
      t.timestamps
    end
  end
end
