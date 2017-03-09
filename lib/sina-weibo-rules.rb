require 'active_support'
require 'httparty'
require 'json'

require 'sina-weibo-rules/api'
require 'sina-weibo-rules/response'
require 'sina-weibo-rules/rule'

module SinaWeibo
  class Rules
    include HTTParty
    include SinaWeibo::API

    headers 'Accept' => 'application/json', 'Content-Type' => 'application/json'
    format :json

    def initialize( configuration = nil, username = nil, password = nil, uri = nil, timeout = 60 )
      @configuration_file = configuration
      unless username && password && uri
        load_credentials!
        username = @config["username"]
        password = @config["password"]
        uri = uri || @config["streaming_url"]
      end

      self.class.basic_auth username , password
      self.class.base_uri uri
      self.class.default_timeout timeout
    end

    def default_timeout(timeout)
      self.class.default_timeout timeout
      self.class.default_options
    end


    private

    def load_credentials!
      if File.exists?( @configuration_file )
         @config = YAML.load_file( @configuration_file )[environment.to_s]
      else
        raise Exception.new( <<-RUBY
          You must provide a configuration file at config/sina-weibo.yml

            development: &development
              username: omg@omg.com
              password: your_password
              account: your_account
              streaming_url: 'https://api.socialgist.com/keywordapi/YOUR_ACCOUNT/sinaweibo/main'

        RUBY
        )
      end
    end

    def environment
      if defined?(Rails)
        Rails.env
      elsif defined?(RAILS_ENV)
        RAILS_ENV
      elsif defined?(RACK_ENV)
        RACK_ENV
      else
        :development
      end
    end

  end
end
