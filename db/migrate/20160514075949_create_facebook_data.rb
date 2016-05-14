class CreateFacebookData < ActiveRecord::Migration
  def change
    create_table :facebook_data do |t|
      t.integer :user_id
      t.string :original_name
      t.string :encoded_name
      t.string :facebook_id
      t.boolean :geocoded, default: false, null: false
      t.timestamps
    end
  end
end
