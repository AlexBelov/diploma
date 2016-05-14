class CreateLinkedinData < ActiveRecord::Migration
  def change
    create_table :linkedin_data do |t|
      t.integer :user_id
      t.string :profile_id
      t.string :first_name
      t.string :last_name
      t.string :encoded_name
      t.string :title
      t.integer :connections
      t.string :country
      t.boolean :geocoded, default: false, null: false
      t.timestamps
    end
  end
end
