require 'bundler'
Bundler.require
require 'active_record'

require "pry-byebug"
desc "drop {{API_NAME_HERE}} database"
task :drop_db do
  conn = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  db_name = conn.spec.config[:database];
  conn.spec.config[:database] = 'postgres';

  ActiveRecord::Base.connection.drop_database(db_name)
end

desc "create {{API_NAME_HERE}} database"
task :create_db do
  conn = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  db_name = conn.spec.config[:database];
  conn.spec.config[:database] = 'postgres';

  ActiveRecord::Base.connection.create_database(db_name)
end

desc "reset {{API_NAME_HERE}} database"
task :reset_db do
  conn = ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  db_name = conn.spec.config[:database];
  conn.spec.config[:database] = 'postgres';

  ActiveRecord::Base.connection.drop_database(db_name)
  ActiveRecord::Base.connection.create_database(db_name)

  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  ActiveRecord::Migrator.migrate('db/migrate')
end

desc "migrate {{API_NAME_HERE}} database"
task :migrate_db do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  ActiveRecord::Migrator.migrate('db/migrate')
end

desc "seed {{API_NAME_HERE}} database"
task :seed_db do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  require_relative './db/seeds.rb'
end
