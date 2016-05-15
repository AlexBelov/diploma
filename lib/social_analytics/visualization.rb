include GnuplotRB
include GnuplotRB::Fit

module SocialAnalytics
  module Visualization
    def self.sources
      Plot.new(
        Analytics.sources,
        style_data: 'histograms',
        style_fill: 'pattern border',
        title: 'Sources statistics',
        ylabel: 'Users'
      )
    end

    def self.graduation_date
      Plot.new(
        Analytics.graduation_date,
        style_data: 'histograms',
        style_fill: 'pattern border',
        title: 'Graduation date statistics',
        ylabel: 'Users'
      )
    end

    def self.countries
      Plot.new(
        Analytics.countries,
        style_data: 'histograms',
        style_fill: 'pattern border',
        title: 'Countries statistics (no Belarus)',
        ylabel: 'Users'
      )
    end

    def self.skills
      Plot.new(
        Analytics.skills,
        style_data: 'histograms',
        style_fill: 'pattern border',
        title: 'Skills (linkedin)',
        ylabel: 'Users',
        xtics: 'nomirror rotate by -45',
        term: ['pngcairo', size: [5000, 600]]
      )
    end

    def self.languages_in_repos
      Plot.new(
        Analytics.languages_in_repos,
        style_data: 'histograms',
        style_fill: 'pattern border',
        title: 'Repositories count by language',
        ylabel: 'Repositories',
        xtics: 'nomirror rotate by -45',
        term: ['pngcairo', size: [5000, 600]]
      )
    end

    def self.companies_countries
      Plot.new(
        Analytics.companies_countries,
        style_data: 'histograms',
        style_fill: 'pattern border',
        title: 'Companies in country statistics',
        ylabel: 'Companies',
        xtics: 'nomirror rotate by -45',
      )
    end

    def self.company_sizes
      Plot.new(
        Analytics.company_sizes,
        style_data: 'histograms',
        style_fill: 'pattern border',
        title: 'Company sizes',
        ylabel: 'Companies',
        xtics: 'nomirror rotate by -45',
      )
    end
  end
end
