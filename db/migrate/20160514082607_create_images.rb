class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.string :link
      t.timestamps
    end
  end
end
