module SocialAnalytics
  class FacebookScraper
    def initialize(token = nil, gid = nil)
      token = token || SocialAnalytics.facebook_token
      @graph = Koala::Facebook::API.new(token)
      @gid = gid || "902859379787469"
      @members = nil
    end

    def get_group_members
      @members = @graph.get_connections(@gid, "members")
    end

    def save_group_members
      self.get_group_members if !@members.present?
      @members.each do |member|
        FacebookData.create(
          original_name: member["name"],
          facebook_id: member["id"]
        )
      end
    end
  end
end
