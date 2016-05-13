module SocialAnalytics
  class FacebookScraper
    def initialize(token)
      @graph = Koala::Facebook::API.new(token)
    end

    def get_group_members(gid)
      @graph.get_connections(gid, "members")
    end
  end
end
