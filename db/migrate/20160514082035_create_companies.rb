class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :linkedin_company_url
      t.string :website
      t.string :company_size
      t.string :company_type
      t.string :industry
      t.date :founded
      t.string :country
      t.timestamps
    end
  end
end
