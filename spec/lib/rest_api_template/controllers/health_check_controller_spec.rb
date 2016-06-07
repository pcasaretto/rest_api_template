require_relative "../../../spec_helper"

RSpec.describe IPPoolsAPI::Controllers::HealthCheckController do
  include Rack::Test::Methods

  let (:status_route) { return "/status"}

  describe "get /status" do
    describe "parameterless requests" do
      it "should information of the api" do
        browser = Rack::Test::Session.new(Rack::MockSession.new(IPPoolsAPI::Controllers::HealthCheckController.new))

        browser.get status_route
        expect(browser.last_response.status).to eq(200)

        result_status = JSON.parse(browser.last_response.body)

        expect(result_status["api_name"]).to eq("IPPoolsAPI")
        expect(result_status["version"]).to eq(IPPoolsAPI::VERSION)
        expect(result_status["environment"]).to eq(ENV["RACK_ENV"])
      end
    end
  end

  describe "head /status" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(IPPoolsAPI::Controllers::HealthCheckController.new))

      browser.head status_route
      expect(browser.last_response.status).to eq(200)
    end
  end

  describe "delete /status" do
    it "should return 404" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(IPPoolsAPI::Controllers::HealthCheckController.new))

      browser.delete status_route
      expect(browser.last_response.status).to eq(404)
    end
  end


  describe "get /" do
    describe "parameterless requests" do
      it "should return empty 200" do
        browser = Rack::Test::Session.new(Rack::MockSession.new(IPPoolsAPI::Controllers::HealthCheckController.new))

        browser.get '/'
        expect(browser.last_response.status).to eq(200)
        expect(browser.last_response.body).to eq("")
      end
    end
  end

  describe "head /" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(IPPoolsAPI::Controllers::HealthCheckController.new))

      browser.head '/'
      expect(browser.last_response.status).to eq(200)
    end
  end

  describe "delete /" do
    it "should return 404" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(IPPoolsAPI::Controllers::HealthCheckController.new))

      browser.delete '/'
      expect(browser.last_response.status).to eq(404)
    end
  end
end
