# frozen_string_literal: true
require 'httparty'
require 'sports/butler/api_base'

module Sports
  module Butler
    class Api < ApiBase

      attr_accessor :response, :sport, :api

      def initialize(sport, api)
        @sport  = sport
        @api    = api

        @response = nil
      end

      def get(path:, filters: {}, result: :default)
        #return invalid_config_result if Configuration.invalid_config?
        @response = process_http_party(path, filters)
        process_response(response, result)
      end

      def process_http_party(path, filters)
        headers = Configuration.http_party_headers(sport, api)
        url     = Configuration.http_party_url(path, sport, api)
        query   = filters || {}
        http_party_get(url, headers, query)
      end

      def process_response(response, result)
        if response.parsed_response.is_a?(Hash) && response.dig('message')
          error_message(response['message'])
        else
          #Configuration.http_party_response(response, result)
          response
        end
      end

      def http_party_get(url, headers, query)
        HTTParty.get "#{url}",
                     headers: headers,
                     query: query,
                     format: :json
      end

    end
  end
end
