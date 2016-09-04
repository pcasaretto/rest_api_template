#!/bin/bash
rm -f /var/app/tmp/pids/server.pid

header_indicator="==========>"
command_indicator=">"
pg_connection_attempt=1
max_pg_attempts=20

wait_for_db(){
  echo "$header_indicator Connecting to $1 container"
  until psql -h $1 -U "postgres" -c '\l' > /dev/null 2>&1; do
    echo "$command_indicator Waiting for $1 container...(${pg_connection_attempt}/${max_pg_attempts})"
    sleep 1
    if [[ $pg_connection_attempt -gt $max_pg_attempts-1 ]]; then
      echo "$header_indicator Failure: The web process could not connect to $1 container after $pg_connection_attempt attempts"
      echo "$command_indicator Please try again running ./script/rd-docker start."
      exit 1;
    fi
    pg_connection_attempt=$((pg_connection_attempt+1))
  done
  echo "$command_indicator $1 container up and running!"
}

ensure_db(){
  echo "$command_indicator Checking Development $1"
  has_db=$(psql -h $1 -U postgres -lqt | cut -d \| -f 1 | grep -w $2 | wc -l )

  if [[ "$has_db" == 0 ]]; then
    echo "$command_indicator $1 setup is necessary"
    bundle exec rake db:setup
  else
    echo "$command_indicator $1 already exists. Skiping database setup."
    echo "$command_indicator Checking for pending migrations."
    bundle exec rake db:migrate
  fi
}

bundle check > /dev/null 2>&1 || bundle install

wait_for_db "db"
ensure_db "db" "{{API_NAME_HERE}}_development"

if [ "$#" == 0 ]
then
  exec bundle exec unicorn -c ./config/unicorn.rb
fi

exec $@
