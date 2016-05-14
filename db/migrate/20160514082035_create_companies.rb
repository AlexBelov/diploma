class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :linkedin_data_id
      t.boolean :current, default: false, null: false
    end
  end
end
