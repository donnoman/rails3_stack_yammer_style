# =============================================================================
# RECIPE INCLUDES
# https://github.com/donnoman/cap-recipes/tree/testing/lib/cap_recipes/tasks
# =============================================================================

require 'rubygems'
require 'cap_recipes/tasks/ree'
require 'cap_recipes/tasks/postfix'
require 'cap_recipes/tasks/cassandra'
require 'cap_recipes/tasks/unicorn/manage'
require 'cap_recipes/tasks/gitosis'

# =============================================================================
# CAPISTRANO CONFIGURATION
# =============================================================================

set :application, "rails3_stack_homerun_style"
set :repository,  "git://github.com/donnoman/rails3_stack_homerun_style.git"
set :branch, "master"
set :deploy_to, "/var/apps/#{application}"
set :deploy_via, :remote_cache
set :scm, :git
ssh_options[:forward_agent] = true


# =============================================================================
# SECRETS
# Roles moved to secrets.rb to preserve unique values for those who may check out
# the project. By keeping them there you don't need to modify this deploy.rb
# =============================================================================

require 'config/secrets'

namespace :deploy do
  desc "Provision the servers"
  task :provision do
    gitosis.install_packages #we just need the dependencies to install git.
    ree.install
    redis.install
    postfix.install
    cassandra.install
  end

end

after "deploy:setup" do
  sudo "chown -R #{user} #{deploy_to}"
end

