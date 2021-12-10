# frozen_string_literal: true
require 'httparty'
require 'sports/butler/api_base'

module Sports
  module Butler
    class Api < ApiBase

      attr_accessor :response, :response_processed, :success, :errors, :response_code,
                    :sport, :api_name

      def initialize(sport, api_name)
        @sport    = sport
        @api_name = api_name

        @response = nil
        @success  = false
        @errors   = []

        @response_code = nil
      end

      def get(path:, filters: {})
        #return invalid_config_result if Configuration.invalid_config?
        @response = process_http_party(path, filters)
        @response_code = response.code

        # TODO: errors!
        # method handling
        @success  = true if response_code == 200

        @response_processed = process_response(response)
      end

      def process_http_party(path, filters)
        headers = Configuration.http_party_headers(sport, api_name)
        url     = Configuration.http_party_url(path, sport, api_name)
        query   = filters || {}
        http_party_get(url, headers, query)
      end

      def process_response(response)
        if response.parsed_response.is_a?(Hash) && response.dig('message')
          error_message(response['message'])
        else
          #Configuration.http_party_response(response)
          response.parsed_response
        end
      end

      def http_party_get(url, headers, query)
        # TODO: remove DEV!
        puts "http_party_get: #{url} #{headers} #{query}"

        HTTParty.get "#{url}",
                     headers: headers,
                     query: query,
                     format: :json
      end

      class << self
        def get(url:, filters: {}, headers: {})
          query   = filters || {}

          HTTParty.get "#{url}",
                       headers: headers,
                       query: query,
                       format: :json
        end
      end
    end
  end
end
