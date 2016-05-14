module SocialAnalytics
  class LinkedinScraper
    def initialize
      @profile = nil
      @public_profile = nil
      @web_scraper = LinkedinWebScraper.new
    end

    def get_public_member(name)
      @public_profile = @web_scraper.scrape(name)
      @profile = Linkedin::Profile.new("http://www.linkedin.com/in/#{@public_profile}", { company_details: true })
    end

    def save_public_member
      LinkedinData.create(
        profile_id: @public_profile,
        first_name: @profile.first_name,
        last_name: @profile.last_name,
        title: @profile.title,
        connections: @profile.number_of_connections.to_i,
        country: @profile.country,
        geocoded: !@profile.country.present?
      )

      @profile.past_companies.each do |company|
      end
    end
  end
end
