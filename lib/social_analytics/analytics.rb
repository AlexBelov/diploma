module SocialAnalytics
  module Analytics
    def self.countries_statistics
      Hash[
        *Address.pluck(:country).
                 group_by{|i| i}.
                 map{|k,v| [k, v.count]}.
                 flatten
      ]
    end
  end
end
