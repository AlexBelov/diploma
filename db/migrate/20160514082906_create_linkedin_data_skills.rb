class CreateLinkedinDataSkills < ActiveRecord::Migration
  def change
    create_table :linkedin_data_skills do |t|
      t.integer :linkedin_data_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
