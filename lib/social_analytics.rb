require 'koala'
require 'mechanize'
require 'octokit'
require 'linkedin_scraper'

require 'social_analytics/scrapers/web_scraper'
require 'social_analytics/scrapers/facebook_scraper'
require 'social_analytics/scrapers/linkedin_scraper'
require 'social_analytics/scrapers/github_scraper'

require 'social_analytics/import.rb'
require 'social_analytics/export.rb'
require 'social_analytics/preprocessing.rb'
require 'social_analytics/geo.rb'

module SocialAnalytics
  class << self
    attr_accessor :facebook_token, :facebook_email, :facebook_password,
                  :linkedin_email, :linkedin_password, :github_login,
                  :github_password
  end

  def self.handle_facebook(gid = nil)
    if FacebookData.count.zero?
      FacebookScraper.new(facebook_token, gid).save_group_members
    end
    FacebookGeo.new(true).handle
  end

  def self.haha
    Linkedin::Profile.new("http://www.linkedin.com/in/belovalexander", { company_details: true })
  end
end
