class Skill < ActiveRecord::Base
  has_and_belongs_to_many :linkedin_data
end
