module SocialAnalytics
  class Report
    def initialize
      @view = ActionView::Base.new(ActionController::Base.view_paths, {})
      @view.extend(ApplicationHelper)
      @view.extend(AppointmentsHelper)
      @view.extend(Rails.application.routes.url_helpers)
      @save_path = Rails.root.join('tmp',"#{Time.now.to_i}.pdf")

      @sources = Export::Images.sources
      @graduation_date = Export::Images.graduation_date
      @countries = Export::Images.countries
      @skills = Export::Images.skills
      @languages_in_repos = Export::Images.languages_in_repos
      @companies_countries = Export::Images.companies_countries
      @company_sizes = Export::Images.company_sizes
    end

    def save
      File.open(@save_path, 'wb') do |file|
        file << rendered_pdf
      end
    end

    private

    def rendered_pdf
      WickedPdf.new.pdf_from_string(
        rendered_view
      )
    end

    def rendered_view
      @view.render(
        :template => 'pdf/report.html.erb',
        :locals => {
          sources: @sources,
          graduation_date: @graduation_date,
          countries: @countries,
          skills: @skills,
          languages_in_repos: @languages_in_repos,
          companies_countries: @companies_countries,
          company_sizes: @company_sizes
        }
      )
    end
  end

end
