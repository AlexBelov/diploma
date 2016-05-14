class User < ActiveRecord::Base
  has_one :facebook_data, dependent: :destroy
  has_one :linkedin_data, dependent: :destroy
  has_one :github_data, dependent: :destroy
  has_one :imported_data, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :images, dependent: :destroy
end