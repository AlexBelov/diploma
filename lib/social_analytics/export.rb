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
      def self.sources
        encode Visualization.sources.to_png
      end

      def self.graduation_date
        encode Visualization.graduation_date.to_png
      end

      def self.countries
        encode Visualization.countries.to_png
      end

      def self.skills
        encode Visualization.skills.to_png
      end

      def self.languages_in_repos
        encode Visualization.languages_in_repos.to_png
      end

      def self.companies_countries
        encode Visualization.companies_countries.to_png
      end

      def self.company_sizes
        encode Visualization.company_sizes.to_png
      end

      private

      def self.encode(image)
        Base64.encode64(image)
      end
    end
  end
end
