module SocialAnalytics
  class Geo
    private
    def geocode(address)
      return if !address.present?
      resp = Geocoder.search(address).first
    end

    def save(resp, addressable_id, addressable_type)
      return if !resp.present?
      address = Address.create(
        addressable_id: addressable_id,
        addressable_type: addressable_type,
        city: resp.city,
        country: resp.country,
        lat: resp.geometry["location"]["lat"],
        lng: resp.geometry["location"]["lng"],
        geocoded: true,
        geocoder_response: resp.to_json
      )
      puts "Save address ##{address.id}".yellow + "(#{resp.country})".blue
    end

    def update(resp, address)
      return if !resp.present?
      address = address.update_attributes(
        city: resp.city,
        country: resp.country,
        lat: resp.geometry["location"]["lat"],
        lng: resp.geometry["location"]["lng"],
        geocoded: true,
        geocoder_response: resp.to_json
      )
      puts "Update address ##{address.id}".yellow + "(#{resp.country})".blue
    end
  end
end
