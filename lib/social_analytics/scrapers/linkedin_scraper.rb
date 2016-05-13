module SocialAnalytics
  class LinkedinScraper
    def initialize
      @profile = nil
    end

    def self.get_public_member(public_profile)
      @profile = Linkedin::Profile.new("http://www.linkedin.com/in/#{public_profile}", { company_details: true })
    end

    def self.first_name
    end

    def self.last_name
    end
  end
end
