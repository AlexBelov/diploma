class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, index: true
      t.string :city
      t.string :country
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.boolean :geocoded, default: false, null: false
      t.json :geocoder_response
      t.timestamps
    end
  end
end
