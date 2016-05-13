Dir.chdir File.dirname(File.dirname(__FILE__))
unless defined? Rails
  APP_PATH = File.expand_path('../../config/application',  __FILE__)
  require File.expand_path('../../config/boot',  __FILE__)
  require APP_PATH
  Rails.application.require_environment!
end
puts "Loaded #{Rails.env} environment"
