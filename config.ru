require 'tus/server'
require 'tus/storage/s3'

s3_options = {
  bucket:             ENV.fetch('S3_BUCKET'),
  region:             ENV.fetch('S3_REGION'),
  access_key_id:      ENV.fetch('S3_ACCESS_KEY_ID'),
  secret_access_key:  ENV.fetch('S3_SECRET_ACCESS_KEY')
}

Tus::Server.opts[:storage] = Tus::Storage::S3.new(
  prefix: 'tus',
  **s3_options
)

Tus::Server.opts[:max_size] = 25 * 1024 * 1024 * 1024 # 25GB max filesize
Tus::Server.opts[:expiration_time]     = 24 * 60 * 60 # 1 day
Tus::Server.opts[:expiration_interval] = 60 * 60 # 1 hour, that's default

map '/tus' do
  run Tus::Server
end
