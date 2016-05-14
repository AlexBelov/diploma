module SocialAnalytics
  class WebScraper
    def initialize
      @agent = Mechanize.new
      @agent.follow_meta_refresh = true
    end
  end
end
