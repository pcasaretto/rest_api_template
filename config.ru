require "bundler"
Bundler.setup
require "rest_api_base"

# Requiring api files
require "./lib/rest_api_template/main.rb"

# Run application
run RestApiTemplate::Main.new

# Settings routes
map("/") { run RestApiTemplate::Controllers::HealthCheckController.new }
map("/model1") { run RestApiTemplate::Controllers::Model1Controller.new }
