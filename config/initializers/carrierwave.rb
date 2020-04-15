CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     'AKIAJJG3I2ZKLZ6FZQVQ',
        aws_secret_access_key: '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',
        region:                'ap-south-1',
    }
    config.fog_directory  = 'rails-bucket-practic'
  end
 