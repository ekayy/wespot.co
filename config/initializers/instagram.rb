require "instagram"

Instagram.configure do |config|
  config.client_id = ENV["IT_CLIENT_ID"]
  config.client_secret = ENV["IT_CLIENT_SECRET"]
end