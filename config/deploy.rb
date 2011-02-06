# =============================================================================
# RECIPE INCLUDES
# =============================================================================

require 'rubygems'
#require 'cap_recipes/tasks/unicorn'
require 'cap_recipes/tasks/ree'
require 'cap_recipes/tasks/redis'
require 'cap_recipes/tasks/resque'
#require 'cap_recipes/tasks/postfix'
#require 'cap_recipes/tasks/resque'
#require 'cap_recipes/tasks/mysql'

#require 'cap_recipes/tasks/cassandra'
#
# =============================================================================
# CAPISTRANO CONFIGURATION
# =============================================================================

set :application, "rails3_stack_homerun_style"
set :repository,  "git@github.com:donnoman/rails3_stack_homerun_style.git"
set :branch, "master"
set :deploy_to, "/var/apps/#{application}"
set :deploy_via, :remote_cache
set :base_ruby_path, '/opt/ruby-enterprise' # not /usr
set :scm, :git
ssh_options[:forward_agent] = true


# =============================================================================
# SECRETS
# Roles moved to secrets.rb to preserve unique values for those who may check out
# the project. By keeping them there you don't need to modify this deploy.rb
# =============================================================================

require 'config/secrets'

#worker: rake resque:work QUEUE=*

namespace :deploy do
  desc "Provision the servers"
  task :provision do
    ree.setup
  end
end



