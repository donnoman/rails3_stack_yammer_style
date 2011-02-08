
#http://sleekd.com/general/configuring-nginx-and-unicorn/
#http://www.rubyrescue.com/blog/2010/06/23/migrating-rails-to-unicorn-from-phusion-passenger/

# http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

workdir = File.expand_path(File.dirname(__FILE__)+ '/..')
worker_processes 3
working_directory workdir

# This loads the application in the master process before forking
# worker processes
# Read more about it here:
# http://unicorn.bogomips.org/Unicorn/Configurator.html
preload_app true

timeout 30

# This is where we specify the socket.
# We will point the upstream Nginx module to this socket later on
listen "#{workdir}/tmp/sockets/unicorn.sock", :backlog => 64

pid "#{workdir}/tmp/pids/unicorn.pid"

# Set the path of the log files inside the log folder of the testapp
stderr_path "#{workdir}/log/unicorn.stderr.log"
stdout_path "#{workdir}/log/unicorn.stdout.log"

before_fork do |server, worker|
# This option works in together with preload_app true setting
# What is does is prevent the master process from holding
# the database connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
# Here we are establishing the connection after forking worker
# processes
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
