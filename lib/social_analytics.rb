require 'koala'
require 'mechanize'
require 'octokit'
require 'linkedin_scraper'

require 'social_analytics/scrapers/facebook_scraper'
require 'social_analytics/scrapers/linkedin_scraper'
require 'social_analytics/scrapers/github_scraper'

require 'social_analytics/scrapers/web_scraper'
require 'social_analytics/scrapers/facebook_web_scraper'
require 'social_analytics/scrapers/linkedin_web_scraper'

require 'social_analytics/geo/geo.rb'
require 'social_analytics/geo/facebook_geo.rb'
require 'social_analytics/geo/addressable_geo.rb'

require 'social_analytics/import.rb'
require 'social_analytics/export.rb'
require 'social_analytics/preprocessing.rb'
require 'social_analytics/analytics.rb'

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

  def self.handle_linkedin
    scraper = LinkedinScraper.new
    User.where(linkedin: false, linkedin_scraped: false).each do |user|
      scraper.get_public_member(user.name)
      user.update_columns(linkedin_scraped: true)
      sleep 1
    end
  end
end
