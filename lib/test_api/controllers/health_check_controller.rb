require_relative "../main.rb"
require_relative "../version.rb"

module RestApiTemplate
  module Controllers
    class HealthCheckController < RestApiTemplate::Main
      get '/' do
      end

      get '/status' do
        status = Hash.new
        status["api_name"] = "Test Api"
        status["version"] = RestApiTemplate::VERSION
        status["environment"] = ENV["RACK_ENV"]

        json status
      end
    end
  end
end
