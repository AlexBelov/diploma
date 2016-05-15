module SocialAnalytics
  class LinkedinScraper
    def initialize
      @profile = nil
      @public_profile = nil
      @web_scraper = LinkedinWebScraper.new
    end

    def get_public_member(name)
      @public_profile = @web_scraper.scrape(name)
      return if @public_profile.nil?
      @profile = begin
        Linkedin::Profile.new("http://www.linkedin.com/in/#{@public_profile}", { company_details: true })
      rescue
        nil
      end
      save_public_member
    end

    def save_companies(companies, current = false)
      companies.each do |data|
        company = Company.where(name: data[:company]).first_or_create do |c|
          c.description = data[:description]
          c.linkedin_company_url = data[:linkedin_company_url]
          c.website = data[:website]
          c.company_size = data[:company_size]
          c.company_type = data[:company_type]
          c.industry = data[:industry]
          c.founded = Preprocessing.foundation_date(data[:founded])
          c.country = data[:country]
        end

        if data[:company_url].present?
          Image.create(
            imageable: company,
            link: data[:company_logo]
          )
        end

        if company.address.present? && data[:country].present?
          Address.create(
            addressable: company,
            country: data[:country]
          )
        end

        Position.create(
          linkedin_data: @linkedin_data,
          company_id: company.id,
          title: data[:title],
          duration: data[:duration],
          start_date: data[:start_date],
          end_date: data[:end_date],
          current: current
        )
      end
    end

    def save_public_member
      return if !@profile.present?

      puts "Found Linkedin user - ".blue + "#{@profile.first_name} #{@profile.last_name}".green

      @linkedin_data = LinkedinData.create(
        profile_id: @public_profile,
        first_name: @profile.first_name,
        last_name: @profile.last_name,
        title: @profile.title,
        connections: @profile.number_of_connections.to_i,
        country: @profile.country
      )

      if @linkedin_data.addresses.empty? && @profile.country.present?
        puts "Saving linkedin address".yellow
        Address.create(
          addressable: @linkedin_data.user,
          country: @profile.country
        )
      end

      if @linkedin_data.skills.empty?
        puts "Saving skills".green
        @profile.skills.each do |skill_name|
          skill = Skill.where(name: skill_name).first_or_create
          @linkedin_data.skills << skill
        end
      end

      puts "Saving companies".yellow
      save_companies(begin @profile.past_companies rescue [] end, false)
      save_companies(begin @profile.current_companies rescue [] end, true)
    end
  end
end
