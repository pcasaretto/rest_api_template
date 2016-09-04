require 'bundler'
Bundler.require
require 'active_record'

require "pry-byebug"
desc "drop rest_api_template database"
task :drop_db do
  conn = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  db_name = conn.spec.config[:database];
  conn.spec.config[:database] = 'postgres';

  ActiveRecord::Base.connection.drop_database(db_name)
end

desc "create rest_api_template database"
task :create_db do
  conn = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  db_name = conn.spec.config[:database];
  conn.spec.config[:database] = 'postgres';

  ActiveRecord::Base.connection.create_database(db_name)
end

desc "reset rest_api_template database"
task :reset_db do
  conn = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  db_name = conn.spec.config[:database];
  conn.spec.config[:database] = 'postgres';

  ActiveRecord::Base.connection.drop_database(db_name)
  ActiveRecord::Base.connection.create_database(db_name)

  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  ActiveRecord::Migrator.migrate('db/migrate')
end

desc "migrate rest_api_template database"
task :migrate_db do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  ActiveRecord::Migrator.migrate('db/migrate')
end

desc "seed rest_api_template database"
task :seed_db do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  require_relative './db/seeds.rb'
end
