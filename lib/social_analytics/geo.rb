module SocialAnalytics
  class Geo
    private
    def geocode(address, user_id)
      return if !address.present?
      resp = Geocoder.search(address).first
      Address.create(
        addressable: User.find(user_id),
        city: resp.city,
        country: resp.country,
        lat: resp.geometry["location"]["lat"],
        lng: resp.geometry["location"]["lng"],
        geocoder_response: resp.to_json
      )
    end
  end

  class FacebookGeo < Geo
    def initialize(debug = false)
      @web_scraper = FacebookWebScraper.new
      @debug = debug
    end

    def handle
      relation = FacebookData.where(geocoded: false)
      relation = relation.last(5) if @debug
      relation.each do |fb|
        @web_scraper.scrape(fb.facebook_id)
        geocode(@web_scraper.current_location, fb.user_id)
        geocode(@web_scraper.from_location, fb.user_id)
        fb.update_columns(geocoded: true)
      end
    end
  end
end
