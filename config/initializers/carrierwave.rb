CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     'avgxgvsgdssxssxv',
        aws_secret_access_key: 'hxjndj7wu8wnszjsnjnxuw82',
        region:                'ap-south-1',
    }
    config.fog_directory  = 'rails-bucket-practic'
  end
 