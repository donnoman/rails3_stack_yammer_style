require 'resque_scheduler'

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

Resque.redis = Redis.new(:host => 'localhost', :port => '6379')

Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")