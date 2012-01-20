require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Manybots < OmniAuth::Strategies::OAuth
      option :name, 'manybots'
      option :client_options, {:authorize_path => '/oauth/authorize',
                               :access_token_path => '/oauth/access_token',
                               :request_token_path => '/oauth/request_token',
                               :site => 'https://www.manybots.com'}

      uid { raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email'],
          :id => raw_info['id'],
          :image => raw_info['avatar_url']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @data ||= MultiJson.decode(access_token.get('/me.json').body)['user']
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end