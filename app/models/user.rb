class User < ActiveRecord::Base
  has_one :facebook_data, dependent: :destroy
  has_one :linkedin_data, dependent: :destroy
  has_many :github_data, dependent: :destroy
  has_one :imported_data, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
end
