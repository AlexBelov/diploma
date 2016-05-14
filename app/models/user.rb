class User < ActiveRecord::Base
  has_one :facebook_data
  has_one :linkedin_data
  has_one :github_data
  has_one :imported_data
  has_many :addresses
  has_many :images
end
