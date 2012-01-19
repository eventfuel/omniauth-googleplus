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

      uid { user_data['id'] }

      info do
        {
          :name => user_data['name'],
          :email => user_data['email'],
          :id => user_data['id'],
          :avatar_url => user_data['avatar_url']
        }
      end

      extra do
        { :user_data => user_data }
      end

      def user_data
        @data ||= MultiJson.decode(access_token.get('/me.json').body)['user']
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end