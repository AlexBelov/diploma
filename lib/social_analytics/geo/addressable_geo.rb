module SocialAnalytics
  class AddressableGeo < Geo
    def initialize(debug = false)
      @debug = debug
    end

    def handle
      relation = Address.where(geocoded: false)
      relation = relation.last(5) if @debug
      relation.each do |address|
        resp = geocode(address.full_address)
        update(resp, address)
      end
    end
  end
end
