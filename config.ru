require './app'
run Sinatra::Application

Giphy::Configuration.configure do |config|
  config.api_key = 'dc6zaTOxFJmzC'
end
