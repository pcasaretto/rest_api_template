worker_processes (ENV['WORKER_PROCESSES'] || 3).to_i
timeout (ENV['WEB_TIMEOUT'] || 6000).to_i
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
