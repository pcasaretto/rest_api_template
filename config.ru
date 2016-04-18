require "bundler"
Bundler.setup
require "rest_api_base"

require File.expand_path "../lib/API_NAME_HERE/main.rb", __FILE__

# Requiring api files
Dir[File.join(File.dirname(__FILE__), "lib", "API_NAME_HERE", "**", "*.rb")].each do |file|
  require file
end

# Run application
run RestApiTemplate::Main.new

# Settings routes
map("/") { run RestApiTemplate::Controllers::HealthCheckController.new }
