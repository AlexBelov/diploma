class Repository < ActiveRecord::Base
  belongs_to :github_data
  has_and_belongs_to_many :languages
  belongs_to :primary_language, class_name: "Language"
end
