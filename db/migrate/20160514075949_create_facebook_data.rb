class CreateFacebookData < ActiveRecord::Migration
  def change
    create_table :facebook_data do |t|
      t.string :original_name
      t.string :encoded_name
      t.string :facebook_id
    end
  end
end
