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

    module Images
      module Users
        def self.sources
          encode Visualization::Users.sources.to_png
        end

        def self.sources
          encode Visualization::Users.graduation_date.to_png
        end

        private

        def self.encode(image)
          Base64.encode64(image)
        end
      end
    end
  end
end
