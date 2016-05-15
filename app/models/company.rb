class Company < ActiveRecord::Base
  has_and_belongs_to_many :linkedin_data, join_table: "companies_linkedin_data"
  has_many :positions
  has_many :images, as: :imageable, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy

  def self.create_addresses
    Company.where("country is not null").each do |company|
      if !company.address.present? && company.country.present?
        Address.create(
          addressable: company,
          country: company.country
        )
      end
    end
  end
end
