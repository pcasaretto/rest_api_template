require "bundler"
Bundler.setup
require "rest_api_base"

require File.expand_path "../lib/{{API_NAME_HERE}}/main.rb", __FILE__

# Requiring api files
require "./lib/{{API_NAME_HERE}}/main.rb"

# Run application
run RestApiTemplate::Main.new

# Settings routes
map("/") { run RestApiTemplate::Controllers::HealthCheckController.new }
map("/model1") { run RestApiTemplate::Controllers::Model1Controller.new }
