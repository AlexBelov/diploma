class ImportController < ApplicationController
  def index
  end

  def upload
    uploaded_io = params[:file]
    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    SocialAnalytics::Import.from_list_of_graduates(path, params[:year])
  end
end
