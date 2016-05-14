module SocialAnalytics
  class FacebookGeo < Geo
    def initialize(debug = false)
      @web_scraper = FacebookWebScraper.new
      @debug = debug
    end

    def handle
      relation = FacebookData.where(address_geocoded: false)
      relation = relation.last(5) if @debug
      relation.each do |fb|
        @web_scraper.scrape(fb.facebook_id)
        [@web_scraper.current_location,@web_scraper.from_location].each do |location|
          resp = geocode(location)
          save(resp, fb.id, fb.class.to_s)
        end
        relation.update_columns(address_geocoded: true)
      end
    end
  end
end
