module SocialAnalytics
  class FacebookScraper
    def initialize(token = nil, gid = nil)
      token = token || SocialAnalytics.facebook_token
      @graph = Koala::Facebook::API.new(token)
      @gid = gid || "902859379787469"
      @members = []
    end

    def get_group_members
      puts "Getting group #{@gid} members...".blue
      begin
        @members = @graph.get_connections(@gid, "members")
      rescue
        puts "Visit https://developers.facebook.com/tools/explorer to refresh token".red
      end
    end

    def save_group_members
      self.get_group_members if !@members.present?
      return if @members.empty?
      @members.each do |member|
        facebook_data = FacebookData.create(
          original_name: member["name"],
          facebook_id: member["id"]
        )
        puts "Save fb user ".blue + "#{facebook_data.user.name}".green
      end
    end
  end
end
