class CreateImportedData < ActiveRecord::Migration
  def change
    create_table :imported_data do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :encoded_name
    end
  end
end
