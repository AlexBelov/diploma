module SocialAnalytics
  module Export
    def self.addresses_for_map(countries_statistics)
      CSV.generate do |csv|
        csv << ["Country (or dependent territory)", "Population"]
        countries_statistics.each do |country, count|
          csv << [country, count.to_s]
        end
        csv << ["Antarctica", "0"] # fix damned map
      end
    end
  end
end
