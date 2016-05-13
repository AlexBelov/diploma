require 'koala'
require 'pry'
require 'awesome_print'
require 'mechanize'
require 'octokit'
require 'linkedin_scraper'

require 'social_analytics/scrapers/facebook_scraper'
require 'social_analytics/scrapers/linkedin_scraper'
# require 'social_analytics/scrapers/github'

module SocialAnalytics
  class << self
    attr_accessor :facebook_token, :facebook_email, :facebook_password,
                  :linkedin_email, :linkedin_password, :github_login,
                  :github_password
  end

  def self.get_group_members(gid)
    SocialAnalytics::FacebookScraper.new(facebook_token).get_group_members(gid)
  end

  def self.haha
    Linkedin::Profile.new("http://www.linkedin.com/in/belovalexander", { company_details: true })
  end
end
