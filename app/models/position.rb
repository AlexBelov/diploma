class Position < ActiveRecord::Base
  belongs_to :linkedin_data
  belongs_to :company
end
