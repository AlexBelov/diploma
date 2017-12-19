class CompaniesController < ApplicationController
  def index
    @page = params[:page] || 1
    @query = params[:q] || ''
    per_page = 20
    @companies = if @query.present?
                   Company.where('name ILIKE :query OR country ILIKE :query', query: @query).order(id: :desc).page(@page).per(per_page)
                 else
                   Company.page(@page).order(id: :desc).per(per_page)
                 end
  end
end
