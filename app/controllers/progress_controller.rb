class ProgressController < ApplicationController
  def index
    @users = ImportedData.count.to_f
    @items = [
      {title: "Users with Github", value: (User.where(github: true).count * 100 / @users).round(0).to_s},
      {title: "Users with Facebook", value: (User.where(facebook: true).count * 100 / User.count.to_f).round(0).to_s},
      {title: "Users with LinkedIn", value: (User.where(linkedin: true).count * 100 / @users).round(0).to_s},
    ]
  end
end
