class LinkedinData < ActiveRecord::Base
  belongs_to :user
  has_many :companies
  has_and_belongs_to_many :skills
end
