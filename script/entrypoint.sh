#!/bin/bash

rm -f /var/app/tmp/pids/server.pid

header_indicator=""
command_indicator=">"
pg_connection_attempt=1
max_pg_attempts=20

echo_command(){
  echo "=> $1"
}

wait_for_db(){
  echo "==========> Connecting to $1 container"
  until psql -h $1 -U "postgres" -c '\l' > /dev/null 2>&1; do
    echo_command "Waiting for $1 container...(${pg_connection_attempt}/${max_pg_attempts})"
    sleep 1
    if [[ $pg_connection_attempt -gt $max_pg_attempts-1 ]]; then
      echo_command "Failure: The web process could not connect to $1 container after $pg_connection_attempt attempts"
      echo_command "Please try again running ./script/rd-docker start."
      exit 1;
    fi
    pg_connection_attempt=$((pg_connection_attempt+1))
  done
  echo_command "$1 container up and running!"
}

ensure_db(){
  echo_command "Checking Development $1"
  has_db=$(psql -h $1 -U postgres -lqt | cut -d \| -f 1 | grep -w $2 | wc -l )

  if [[ "$has_db" == 0 ]]; then
    echo_command "$1 setup is necessary"
    bundle exec rake create_db
  else
    echo_command "$1 already exists. Skiping database setup."
    echo_command "Checking for pending migrations."
    bundle exec rake migrate_db
  fi
}

bundle check > /dev/null 2>&1 || bundle install

wait_for_db "db"
ensure_db "db" "rest_api_template_db"

if [ "$#" == 0 ]
then
  exec bundle exec unicorn -c ./config/unicorn.rb
fi

exec $@
