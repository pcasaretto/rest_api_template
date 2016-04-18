require 'rest_api_base'
require 'buffered_logger'
require 'json'
require 'fileutils'
require 'active_record'

# require_relative 'middlewares/url_based_304.rb'

module RestApiTemplate
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

      # Set the database connections if needed
      # ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
      # ActiveRecord::Base.logger = logger

      # Adding Middlewares
      # Use this middleware for request caching based on url, mainly useful for static content
      # use RestApiBase::Middlewares::UrlBased304, :cache_expiration_seconds => ENV['HTTP_CACHE_EXPIRATION']

      # Logger middleware for detailed logging
      use RestApiBase::Middlewares::RequestLogger, :logger => logger

      # Add this middleware to prevent unsuported payloads
      # use RestApiBase::Middlewares::SupportedMediaTypes

      # Use this middleware to allow cross domain call on this api
      # use RestApiBase::Middlewares::AllowCrossDomain
    end
  end
end
