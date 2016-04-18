require 'bundler'
Bundler.require
require 'active_record'

desc "migrate your database"
task :migrate_db do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  ActiveRecord::Migrator.migrate('db/migrate')
end

desc "seed your database"
task :seed_db do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  require_relative './db/seeds.rb'
end
