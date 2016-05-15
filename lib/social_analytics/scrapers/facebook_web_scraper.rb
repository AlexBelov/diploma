module SocialAnalytics
  class FacebookWebScraper < WebScraper
    def scrape(facebook_id)
      authorization if !@logged_in
      @body = begin
        @agent.get("https://www.facebook.com/#{facebook_id}").body
      rescue
        puts "Problem with getting fb profile".red
        nil
      end
    end

    def current_location
      begin
        @body.scan(/Lives in .*? href=\"(.*?)\?ref=br_rs/).flatten.first.
              scan(/https:\/\/www.facebook.com\/pages\/(.*?)\//).flatten.first
      rescue
        nil
      end
    end

    def from_location
      begin
        @body.scan(/From .*? href=\"(.*?)\?ref=br_rs/).flatten.first.
              scan(/https:\/\/www.facebook.com\/pages\/(.*?)\//).flatten.first
      rescue
        nil
      end
    end

    private

    def authorization
      @agent.get('http://m.facebook.com')
      form = @agent.page.form_with(:method => 'POST')
      form.email = SocialAnalytics.facebook_email
      form.pass = SocialAnalytics.facebook_password
      @agent.submit(form)
      @logged_in = !@agent.page.uri.to_s.match('home.php').nil?
    end
  end
end
