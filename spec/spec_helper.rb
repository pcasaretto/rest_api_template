require 'rspec'
require 'rack/test'
require 'active_record'
require 'factory_girl'
require 'faker'
require 'pry-byebug'

ENV['RACK_ENV'] = 'test'

# Requiring api files
Dir[File.join(File.dirname(__FILE__), '..', "lib", "API_NAME_HERE", "**", "*.rb")].each do |file|
  require file
end

RSpec.configure do |config|
  conn = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  db_name = "#{conn.spec.config[:database]}_#{DateTime.now.strftime('%Q')}";
  ActiveRecord::Base.connection.create_database(db_name)
  temp_database_url = ENV['DATABASE_URL'].sub(conn.spec.config[:database], db_name)
  conn.disconnect!

  config.before(:suite) do
    ActiveRecord::Base.establish_connection(temp_database_url)
    ActiveRecord::Migrator.migrate('db/migrate')
  end

  config.after(:suite) do
    begin
      # DROP ALL CONNECTIONS
      ActiveRecord::Base.connection.select_all "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where datname='#{db_name}';"
    rescue
    end

    conn = ActiveRecord::Base.establish_connection(temp_database_url)
    conn.spec.config[:database] = nil;

    ActiveRecord::Base.connection.drop_database(db_name)
  end

  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.find_definitions
