class CreateLinkedinData < ActiveRecord::Migration
  def change
    create_table :linkedin_data do |t|
      t.string :profile_id
      t.string :first_name
      t.string :last_name
      t.string :title
      t.integer :connections
      t.boolean :parsed, default: false, null: false
    end
  end
end
