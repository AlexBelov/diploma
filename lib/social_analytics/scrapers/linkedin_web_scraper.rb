module SocialAnalytics
  class LinkedinWebScraper < WebScraper
    def scrape(name)
      authorization if !@logged_in
      url = "http://www.linkedin.com/vsearch/p?type=people&keywords=#{name.split(' ').join('+')}"
      @results = @agent.get(url).body.scan(/\{"person"\:\{.*?\}\}/)
      @profile_id = JSON.parse(@results[0]).to_s.scan(/profile\/view\?id=(.*?)&/).compact.first.first
      get_public_profile
    end

    def get_public_profile
      url = "http://www.linkedin.com/profile/view?id=#{@profile_id}"
      profile_raw = @agent.get(url).body
      @public_profile = profile_raw.scan(/https:\/\/www.linkedin.com\/in\/(.*?)\"/).first.first
    end

    private

    def authorization
      @agent.get('https://www.linkedin.com/')
      form = @agent.page.form_with(:method => 'POST')
      form.session_key = SocialAnalytics.linkedin_email
      form.session_password = SocialAnalytics.linkedin_password
      resp = @agent.submit(form)
      @logged_in = resp.title == "Welcome! | LinkedIn"
    end
  end
end
