TASKRABBIT = YAML.load_file("#{Rails.root}/config/taskrabbit.yml") unless ENV['TASKRABBIT_KEY']

Taskrabbit.configure do |config|
  config.api_key       = ENV['TASKRABBIT_KEY'] || TASKRABBIT['key']
  config.api_secret    = ENV['TASKRABBIT_SECRET'] || TASKRABBIT['secret']
  config.base_uri      = ENV['TASKRABBIT_URI'] || TASKRABBIT['uri']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :taskrabbit, ENV['TASKRABBIT_KEY'] || TASKRABBIT['key'], ENV['TASKRABBIT_SECRET'] || TASKRABBIT['secret']
end