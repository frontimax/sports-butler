# frozen_string_literal: true
require 'httparty'

module Sports
  module Butler
    class Api < ApiBase

      class << self
        def get(path:, filters: {}, result: :default)
            get_default(path: path, filters: filters, result: result)
        end

        private

        def get_default(path:, filters: {}, result: :default)
          return invalid_config_result if invalid_config?
          response = process_http_party(path, filters)
          process_response(response, result)
        end

        def process_http_party(path, filters)
          headers = Configuration.http_party_headers
          url     = Configuration.http_party_url(path)
          query   = filters || {}
          http_party_get(url, headers, query)
        end

        def process_response(response, result)
          if response.parsed_response.is_a?(Hash) && response.dig('message')
            error_message(response['message'])
          else
            Configuration.http_party_response(response, result)
          end
        end

        def http_party_get(url, headers, query)
          Tier.count_request

          HTTParty.get "#{url}",
                       headers: headers,
                       query: query,
                       format: :json
        end

        def invalid_config?
          Configuration.api_token.blank? || !Configuration.api_name_valid?(Configuration.api_name)
        end

      end
    end
  end
end
