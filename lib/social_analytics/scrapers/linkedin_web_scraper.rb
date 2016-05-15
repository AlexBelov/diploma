module SocialAnalytics
  class LinkedinWebScraper < WebScraper
    def scrape(name)
      authorization if !@logged_in
      url = "http://www.linkedin.com/vsearch/p?type=people&keywords=#{name.split(' ').join('+')}"
      @results = @agent.get(url).body.scan(/\{"person"\:\{.*?\}\}/)
      return if !@results[0].present?
      @profile_id = begin
        JSON.parse(@results[0]).to_s.scan(/profile\/view\?id=(.*?)&/).compact.first.first
      rescue
        nil
      end
      get_public_profile
    end

    def get_public_profile
      return if @profile_id.nil?
      url = "http://www.linkedin.com/profile/view?id=#{@profile_id}"
      profile_raw = @agent.get(url).body
      @public_profile = begin
        profile_raw.scan(/\.com\/in\/(.*?)\//).first.first
      rescue
        nil
      end
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
