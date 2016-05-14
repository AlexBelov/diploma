class MapController < ApplicationController
  def index
    @type = "map/all_addresses"
  end

  def users
    @type = "user_addresses"
    render :index
  end

  def companies
    @type = "company_addresses"
    render :index
  end

  def all_addresses
    respond_to do |format|
      format.csv { render text: Address.to_csv }
    end
  end

  def user_addresses
    respond_to do |format|
      format.csv { render text: Address.where(addressable_type: "User").to_csv }
    end
  end

  def company_addresses
    respond_to do |format|
      format.csv { render text: Address.where(addressable_type: "Company").to_csv }
    end
  end
end
