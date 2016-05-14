class MapController < ApplicationController
  def index
  end

  def population
    respond_to do |format|
      format.csv { render text: Address.where(addressable_type: "User").to_csv }
    end
  end
end
