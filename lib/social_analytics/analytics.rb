module SocialAnalytics
  module Analytics
    def self.count_in_array(array)
      Hash[
        array.
        group_by{|i| i}.
        map{|k,v| [k, v.count]}
      ]
    end

    def self.sources
      Daru::DataFrame.new({
        Facebook: [FacebookData.count],
        Import: [ImportedData.count],
        Github: [GithubData.count],
        Linkedin: [LinkedinData.count]
        },
        index: ['Sources']
      )
    end

    def self.graduation_date
      Daru::DataFrame.new({
        y2013: [ImportedData.where(graduated_at: Preprocessing.graduation_date(2013)).count],
        y2014: [ImportedData.where(graduated_at: Preprocessing.graduation_date(2014)).count],
        y2015: [ImportedData.where(graduated_at: Preprocessing.graduation_date(2015)).count]
        },
        index: ['Year of graduation']
      )
    end

    def self.countries
      st = Address.where(addressable_type: ["User", "FacebookData"]).countries_statistics
      st.delete("Belarus")
      Daru::DataFrame.new(
        Hash[st.map{|k,v| [k.to_sym, [v]]}],
        index: ['Countries']
      )
    end

    def self.skills
      skills = LinkedinDataSkills.includes(:skill).map{|r| r.skill.name}
      sorted = count_in_array(skills).sort_by{|k,v| -v}.first(100)
      Daru::DataFrame.new({
          skills: sorted.map{|l| l[1]}
        },
        index: sorted.map{|l| l[0]}
      )
    end

    def self.languages_in_repos
      languages = LanguagesRepositories.includes(:language).map{|r| r.language.name}
      sorted = count_in_array(languages).sort_by{|k,v| -v}.first(100)
      Daru::DataFrame.new({
          repositories: sorted.map{|l| l[1]}
        },
        index: sorted.map{|l| l[0]}
      )
    end

    def self.companies_countries
      st = Address.where(addressable_type: ["Company"]).countries_statistics
      sorted = st.sort_by{|k,v| -v}
      Daru::DataFrame.new({
          companies: sorted.map{|l| l[1]}
        },
        index: sorted.map{|l| l[0]}
      )
    end

    def self.company_sizes
      sizes = Company.pluck(:company_size).compact.sort_by{|size| size.to_i}
      count = count_in_array(sizes)
      Daru::DataFrame.new({
          companies: count.map{|k,v| v}
        },
        index: count.map{|k,v| k}
      )
    end
  end
end
