source 'http://rubygems.org'

gem 'rails', '3.0.3'
if File.exists?(recipes_path = "../cap-recipes")
  gem 'cap-recipes', :path => recipes_path, :require => false
else
  gem 'cap-recipes', :git => "git://github.com/donnoman/cap-recipes.git", :branch => "testing",  :require => false
end

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
#gem "simple_form"
#gem "responders"
#gem "devise"
#gem "will_paginate", "~> 3.0.pre2"
#gem 'acts-as-taggable-on'
gem "rspec"
gem "rspec-rails"
#gem 'cancan'
#gem 'newrelic_rpm'
#gem 'ancestry'
#gem 'aws-s3'
#gem 'paperclip'

group :development do
  gem "ruby-debug"
  gem "capistrano"
#  gem "ruby-debug19"
#  gem "looksee"
#  gem "wirble"
#  gem "hirb"
#  gem "map_by_method"
#  gem "what_methods"
#  gem "awesome_print"
#  gem "railroady"
#  gem 'heroku'
#  gem 'taps'
#  gem 'heroku_san'
#  gem 'interactive_editor'
end


group :test, :development do
#  gem "factory_girl_rails"
#  gem "factory_girl"
#  gem "capybara"
#  gem "database_cleaner"
#  gem "spork"
#  gem "launchy"
#  gem 'ci_reporter'
#  gem "hpricot"
#  gem "ruby_parser"
#  gem 'fuubar'
#  gem 'ZenTest'
#  gem 'autotest-growl'
#  gem 'autotest-fsevent'
end

group :production do
# enable for memcached support:
# gem 'dalli'
end
