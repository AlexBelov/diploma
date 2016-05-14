class Company < ActiveRecord::Base
  has_and_belongs_to_many :linkedin_data
  has_many :positions
  has_many :images, as: :imageable, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
end
