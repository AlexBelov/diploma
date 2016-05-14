class Address < ActiveRecord::Base
  belongs_to :user

  def self.to_csv
    SocialAnalytics::Export.addresses_for_map
  end
end
