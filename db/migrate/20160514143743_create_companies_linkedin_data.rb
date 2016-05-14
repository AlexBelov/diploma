class CreateCompaniesLinkedinData < ActiveRecord::Migration
  def change
    create_table :companies_linkedin_data do |t|
      t.integer :company_id
      t.integer :linkedin_data_id
      t.timestamps
    end
  end
end
