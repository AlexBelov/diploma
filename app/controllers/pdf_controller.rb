class PdfController < ApplicationController
  def report
    @sources = SocialAnalytics::Export::Images.sources
    @graduation_date = SocialAnalytics::Export::Images.graduation_date
    @countries = SocialAnalytics::Export::Images.countries
    @skills = SocialAnalytics::Export::Images.skills
    @languages_in_repos = SocialAnalytics::Export::Images.languages_in_repos
    @companies_countries = SocialAnalytics::Export::Images.companies_countries
    @company_sizes = SocialAnalytics::Export::Images.company_sizes

    respond_to do |format|
      format.pdf do
        @debug = false
        render pdf: "report.pdf",
               template: "pdf/report.html.erb"
      end

      @debug = true
      format.html
    end
  end
end
