class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :linkedin_data_id
      t.string :integer
      t.integer :company_id
      t.string :title
      t.string :duration
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
