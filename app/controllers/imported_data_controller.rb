class ImportedDataController < ApplicationController
  def index
    @page = params[:page] || 1
    @query = params[:q] || ''
    per_page = 20
    @users = if @query.present?
               ImportedData.where('first_name ILIKE :query OR last_name ILIKE :query OR middle_name ILIKE :query OR encoded_name ILIKE :query', query: @query).order(id: :desc).page(@page).per(per_page)
             else
               ImportedData.page(@page).order(id: :desc).per(per_page)
             end
  end
end
