module SocialAnalytics
  class FacebookScraper
    def initialize(token = nil, gid = nil)
      token = token || SocialAnalytics.facebook_token
      @graph = Koala::Facebook::API.new(token)
      @gid = gid || "902859379787469"
      @members = []
    end

    def get_group_members
      begin
        @members = @graph.get_connections(@gid, "members")
      rescue
        puts "Visit https://developers.facebook.com/tools/explorer to refresh token"
      end
    end

    def save_group_members
      self.get_group_members if !@members.present?
      return if @members.empty?
      @members.each do |member|
        puts "Save fb user #{member["name"]}".blue
        FacebookData.create(
          original_name: member["name"],
          facebook_id: member["id"]
        )
      end
    end
  end
end
