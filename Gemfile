source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'mysql2'
gem "unicorn"
gem "haml"
gem "haml-rails"
#http://blog.redistogo.com/2010/07/26/resque-with-redis-to-go/
gem 'resque'
#http://blog.redistogo.com/2010/08/05/resque-scheduler/
gem 'resque-scheduler'
#WARNING: using the built-in Timeout class which is known to have issues when used for opening connections. Install the SystemTimer gem if you want to make sure the Redis client will not hang.
gem "SystemTimer", :require => "system_timer", :platforms => :ruby_18

group :development do
  gem "ruby-debug"
  gem "capistrano"
  if File.exists?(recipes_path = "../cap-recipes")
    gem 'cap-recipes', :path => recipes_path, :require => false
  else
    gem 'cap-recipes', :git => "git://github.com/donnoman/cap-recipes.git", :branch => "testing",  :require => false
  end
end


group :test, :development do
  gem "rspec"
  gem "rspec-rails"
end

group :production do
# enable for memcached support:
# gem 'dalli'
end
