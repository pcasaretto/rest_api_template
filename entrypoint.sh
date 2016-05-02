#!/bin/sh

{
  echo "Droping database" &&
  bundle exec rake drop_db &&

  echo "Creating database" &&
  bundle exec rake create_db &&

  echo "Creating database structure" &&
  bundle exec rake migrate_db &&

  echo "Seeding database information" &&
  bundle exec rake seed_db
} || echo "Already existing database"

bundle exec unicorn -p $WEB_SERVER_PORT -c ./config/unicorn.rb
