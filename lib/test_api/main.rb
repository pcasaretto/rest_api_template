require 'rest_api_base'
require 'buffered_logger'
require 'json'
require 'fileutils'
require 'active_record'

# require_relative 'middlewares/url_based_304.rb'

module TestApi
  class Main < RestApiBase::Controllers::RestApiBaseController
    if development?
      require "sinatra/reloader"
      require "pry-byebug"

      register Sinatra::Reloader
    end

    configure do
      # Disable unused features to speed up
      disable :method_override
      disable :static

      # Hide exception from users
      set :show_exceptions => false
      set :dump_errors, false

      # Set app's root
      set :root, File.dirname(__FILE__)

      # Load logger to be injected
      FileUtils::mkdir_p(File.dirname(ENV['LOGGER_FILE']))
      logger = BufferedLogger.new(ENV['LOGGER_FILE'])

      set :logger => logger

      # Set persistence layer
      ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
      ActiveRecord::Base.logger = logger

      # Adding Middlewares
      use RestApiBase::Middlewares::UrlBased304, :cache_expiration_seconds => ENV['HTTP_CACHE_EXPIRATION']
      use RestApiBase::Middlewares::RequestLogger, :logger => logger
      use RestApiBase::Middlewares::SupportedMediaTypes
      use RestApiBase::Middlewares::AllowCrossDomain
    end
  end
end
