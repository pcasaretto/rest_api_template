require_relative "../main.rb"
require_relative "../version.rb"

module TestApi
  module Controllers
    class HealthCheckController < TestApi::Main
      get '/' do
      end

      get '/status' do
        status = Hash.new
        status["api_name"] = "Test Api"
        status["version"] = TestApi::VERSION
        status["environment"] = ENV["RACK_ENV"]

        json status
      end
    end
  end
end
