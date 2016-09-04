worker_processes ENV['UNICORN_WORKER_PROCESSES'].to_i
timeout ENV['UNICORN_WEB_TIMEOUT'].to_i
listen ENV['UNICORN_WEB_SERVER_PORT']
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']) if defined?(ActiveRecord::Base)
end
