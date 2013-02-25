CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    :region                 => 'us-west-1'
  }
  config.fog_directory = ENV["AWS_S3_BUCKET"]                     # required
  # config.fog_host       = 'https://assets.wespot.com'            # optional, defaults to nil
  config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
