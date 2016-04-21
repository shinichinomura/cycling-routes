CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['CYCLING_ROUTES_AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['CYCLING_ROUTES_AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

  config.fog_directory = ENV['CYCLING_ROUTES_FOG_DIRECTORY'] if ENV['CYCLING_ROUTES_CARRIER_WAVE_FOG_DIRECTORY'].present?

  config.asset_host = ENV['CYCLING_ROUTES_CARRIER_WAVE_ASSET_HOST'] if ENV['CYCLING_ROUTES_CARRIER_WAVE_ASSET_HOST'].present?
end
