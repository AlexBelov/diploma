class GithubDataController < ApplicationController
  def index
    @page = params[:page] || 1
    @query = params[:q] || ''
    per_page = 20
    @github_data = if @query.present?
                     GithubData.where('login ILIKE :query OR name ILIKE :query OR email ILIKE :query', query: @query).order(id: :desc).page(@page).per(per_page).includes(:stars)
                   else
                     GithubData.page(@page).order(id: :desc).per(per_page).includes(:stars)
                   end
  end

  def show
    @recommendations = GithubData.find(params[:id]).recommendations
  end
end
