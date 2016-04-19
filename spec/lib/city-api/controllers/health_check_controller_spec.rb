require_relative "../../../spec_helper"

describe RestApiTemplate::Controllers::HealthCheckController do
  include Rack::Test::Methods

  let (:status_route) { return "/status"}

  describe "get /status" do
    describe "parameterless requests" do
      it "should information of the api" do
        browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

        browser.get status_route
        expect(browser.last_response.status).to eq(200)

        result_status = JSON.parse(browser.last_response.body)

        expect(result_status["api_name"]).to eq("RestApiTemplate")
        expect(result_status["version"]).to eq(RestApiTemplate::VERSION)
        expect(result_status["environment"]).to eq(ENV["RACK_ENV"])
      end
    end
  end

  describe "head /status" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.head status_route
      expect(browser.last_response.status).to eq(200)
    end
  end

  describe "post /status" do
    it "should return 415" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.post status_route
      expect(browser.last_response.status).to eq(415)
    end
  end

  describe "delete /status" do
    it "should return 404" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.delete status_route
      expect(browser.last_response.status).to eq(404)
    end
  end

  describe "put /status" do
    it "should return 415" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.put status_route
      expect(browser.last_response.status).to eq(415)
    end
  end

  describe "options /status" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.options status_route
      expect(browser.last_response.status).to eq(200)
    end
  end


  describe "get /" do
    describe "parameterless requests" do
      it "should return empty 200" do
        browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

        browser.get '/'
        expect(browser.last_response.status).to eq(200)
        expect(browser.last_response.body).to eq("")
      end
    end
  end

  describe "head /" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.head '/'
      expect(browser.last_response.status).to eq(200)
    end
  end

  describe "post /" do
    it "should return 415" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.post '/'
      expect(browser.last_response.status).to eq(415)
    end
  end

  describe "delete /" do
    it "should return 404" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.delete '/'
      expect(browser.last_response.status).to eq(404)
    end
  end

  describe "put /" do
    it "should return 415" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.put '/'
      expect(browser.last_response.status).to eq(415)
    end
  end

  describe "options /" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::HealthCheckController.new))

      browser.options '/'
      expect(browser.last_response.status).to eq(200)
    end
  end
end
