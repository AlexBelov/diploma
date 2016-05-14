class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :linkedin_data_id
      t.integer :company_id
      t.string :title
      t.string :duration
      t.date :start_date
      t.date :end_date
      t.boolean :current, default: false, null: false
      t.timestamps
    end
  end
end
