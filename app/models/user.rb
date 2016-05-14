class User < ActiveRecord::Base
  has_one :facebook_data
  has_one :linkedin_data
  has_many :github_data
  has_one :imported_data
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
end
