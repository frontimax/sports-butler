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

      AVAILABLE_SPORT_API = {
        soccer: [:football_data_org, :apifootball_com, :api_football_com],
        basketball: [:api_basketball_com]
      }

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

          @api_token  ||= default_api_hash
          @api_endpoint  ||= default_api_hash

          @header_token_name ||= set_header_token_name
          @header_additional ||= {}

        end

        def default_api_hash
          { soccer: {}, basketball: {} }
        end

        def set_header_token_name
          {
            soccer: {
              football_data_org: 'X-Auth-Token',
              api_football_com: 'x-apisports-key'
            },
            basketball: {
              api_basketball_com: 'x-apisports-key'
            }
          }
        end

        def invalid_config?(sport, api_name)
          Configuration.api_token[sport][api_name].blank? ||
            !Configuration.valid_sport_api?(sport, api_name)
        end

        def http_party_url(path, sport, api_name)
          case api_name
          when :apifootball_com
            "#{Configuration.api_endpoint[sport][api_name]}?#{path}&APIkey=#{Configuration.api_token[sport][api_name]}"
          else
            "#{Configuration.api_endpoint[sport][api_name]}/#{path}"
          end
        end

        def http_party_headers(sport, api_name)
          result = case api_name

                   # SOCCER
                   when :apifootball_com
                     {}
                   when :football_data_org, :api_football_com
                     { Configuration.header_token_name[sport][api_name] => Configuration.api_token[sport][api_name] }

                   # BASKETBALL
                   when :api_basketball_com
                     { Configuration.header_token_name[sport][api_name] => Configuration.api_token[sport][api_name] }
                   end

          result.merge!(Configuration.header_additional)
          result
        end

        def valid_sport_api?(sport, api_name)
          AVAILABLE_SPORT_API[sport]&.any?{|name| name == api_name}
        end
      end
    end
  end
end