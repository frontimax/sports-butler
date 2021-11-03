# frozen_string_literal: true

module Sports
  module Butler
    class Configuration
      # Sports
      AVAILABLE_SPORTS = [:soccer, :basketball]

      # APIs
      AVAILABLE_APIS = [
        # Soccer
        :football_data_org, :apifootball_com, :api_football_com,
        # Basketball
        :api_basketball_com
      ]

      def initialize
        # ???
      end

      class << self
        #
        attr_accessor :api_token, :api_endpoint,
                      :header_token_name, :header_additional

        def configure
          raise "You need to configure sports-butler first, see readme." unless block_given?

          yield self

          # config.api_token[:soccer][:api_football_com]  = ENV['API_TOKEN_API_DASH_COM']
          @api_token  ||= default_api_hash
          @api_endpoint  ||= default_api_hash

          @header_token_name ||= set_header_token_name
          @header_additional ||= {}

        end

        def default_api_hash
          { soccer: {}, basket_ball: {} }
        end

        def set_header_token_name
          {
            soccer: {
              football_data_org: 'X-Auth-Token',
              api_football_com: 'x-apisports-key'
            },
            basket_ball: {
            }
          }
        end

        # TODO!
        def invalid_config?
          Configuration.api_token.blank? ||
            !Configuration.api_name_valid?(Configuration.api_name)
        end

        def http_party_url(path, sport, api)
          # TODO: sports switch!
          case api
          when :apifootball_com
            "#{Configuration.api_endpoint[sport][api]}/#{path}&APIkey=#{Configuration.api_token[sport][api]}"
          when :football_data_org
            "#{Configuration.api_endpoint[sport][api]}/#{path}"
          when :api_football_com
            "#{Configuration.api_endpoint[sport][api]}/#{path}"
          end
        end

        def http_party_headers(sport, api)
          result = case api
                   when :apifootball_com
                     {}
                   when :football_data_org, :api_football_com
                     { Configuration.header_token_name[sport][api] => Configuration.api_token[sport][api] }
                   end

          result.merge!(Configuration.header_additional)
          result
        end

        ## old!
        def valid_sport?(sport)
          AVAILABLE_SPORTS.include?(sport.to_sym)
        end

        def valid_api?(api)
          AVAILABLE_APIS.include?(api.to_sym)
        end

        def valid_sport_api?(sport, api)
          valid_sport?(sport) && valid_api?(api)
        end
      end
    end
  end
end