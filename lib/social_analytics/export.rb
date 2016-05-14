module SocialAnalytics
  module Export
    def self.addresses_for_map
      countries = Analytics.countries_statistics
      CSV.generate do |csv|
        csv << ["Country (or dependent territory)", "Population"]
        countries.each do |country, count|
          csv << [country, count.to_s]
        end
      end
    end
  end
end
