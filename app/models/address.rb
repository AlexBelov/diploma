class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  def self.countries_statistics
    Hash[
      *pluck(:country).
      group_by{|i| i}.
      map{|k,v| [k, v.count]}.
      flatten
    ]
  end

  def self.to_csv
    SocialAnalytics::Export.addresses_for_map(self.countries_statistics)
  end
end
