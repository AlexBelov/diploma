class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :facebook
      t.boolean :linkedin
      t.boolean :github
      t.boolean :import
      t.timestamps
    end
  end
end
