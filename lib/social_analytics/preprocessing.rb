require 'russian'

module SocialAnalytics
  module Preprocessing
    def self.encode_name(name)
      Russian.translit(name)
    end

    def self.graduation_date(year)
      year.present? ? Date.strptime("#{year}-07-01", '%Y-%m-%d')   : nil
    end
  end
end
