require_relative "../../../spec_helper"

describe RestApiTemplate::Controllers::Model1Controller do
  include Rack::Test::Methods

  before(:all) do
    @model1 = []
    @model2 = []

    5.times do
      @model2 << create(:model2)
    end

    5.times do
      @model1 << create(:model1)
    end
  end

  describe "get /" do
    describe "parameterless requests" do
      it "should return 15 first model1 orderd by name" do
        browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

        browser.get '/'
        expect(browser.last_response.status).to eq(200)

        result_model1 = JSON.parse(browser.last_response.body)

        ordered_model1 = result_model1.sort { |model11, model12| model11["name"] <=> model12["name"]}

        expect(result_model1.size).to eq(15)

        result_model1.each_index do |index|
          expect(result_model1[index]["name"]).to eq(ordered_model1[index]["name"])
        end
      end
    end


    describe "parameter term" do
      it "should return only model1 which starts with term" do
        browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

        browser.get '/', term: 'A'
        expect(browser.last_response.status).to eq(200)

        result_model1 = JSON.parse(browser.last_response.body)

        ordered_model1 = result_model1.sort_by { |model1| model1["name"] }

        expect(result_model1.size).to eq(5)

        result_model1.each_index do |index|
          expect(result_model1[index]["name"]).to eq(ordered_model1[index]["name"])
          expect(result_model1[index]["name"].starts_with?("A")).to be_truthy
        end
      end

      it "should return nothing with a non existing term" do
        browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

        browser.get '/', term: 'ZZZ'
        expect(browser.last_response.status).to eq(200)

        result_model1 = JSON.parse(browser.last_response.body)
        expect(result_model1.size).to eq(0)
      end
    end
  end

  describe "head /" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

      browser.head '/'
      expect(browser.last_response.status).to eq(200)
    end
  end

  describe "post /" do
    it "should return 415" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

      browser.post '/'
      expect(browser.last_response.status).to eq(415)
    end
  end

  describe "delete /" do
    it "should return 404" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

      browser.delete '/'
      expect(browser.last_response.status).to eq(404)
    end
  end

  describe "put /" do
    it "should return 415" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

      browser.put '/'
      expect(browser.last_response.status).to eq(415)
    end
  end

  describe "options /" do
    it "should return 200" do
      browser = Rack::Test::Session.new(Rack::MockSession.new(RestApiTemplate::Controllers::Model1Controller.new))

      browser.options '/'
      expect(browser.last_response.status).to eq(200)
    end
  end
end
