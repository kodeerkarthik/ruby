CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     'AKIAI5AGEKZ2OUHAJMEA',
        aws_secret_access_key: "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",
        region:                'ap-south-1',
    }
    config.fog_directory  = 'rails-bucket-practic'
  end
 