class LinkedinController < ApplicationController
  def index
    @page = params[:page] || 1
    @query = params[:q] || ''
    per_page = 20
    @users = if @query.present?
               LinkedinData.where('first_name ILIKE :query OR last_name ILIKE :query', query: @query).order(id: :desc).page(@page).per(per_page)
             else
               LinkedinData.page(@page).order(id: :desc).per(per_page)
             end
  end
end
