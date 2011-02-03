set :application, "rails3_stack_homerun_style"
set :repository,  "git@github.com:donnoman/rails3_stack_homerun_style.git"
set :branch, "master"
set :user, "root"

set :deploy_to, "/app/#{application}"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true

set :scm, :git

# Roles moved to secrets.rb to preserve unique values for those who may check out
# the project. By keeping them there you don't need to modify this deploy.rb

require 'config/secrets'

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end