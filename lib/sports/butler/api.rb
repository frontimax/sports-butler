# frozen_string_literal: true
require 'httparty'
require 'sports/butler/api_base'

module Sports
  module Butler
    class Api < ApiBase

      attr_accessor :response, :parsed_response, :success, :errors, :response_code,
                    :sport, :api_name, :url, :headers, :query

      def initialize(sport, api_name)
        @sport    = sport
        @api_name = api_name

        @response = nil
        @success  = false
        @errors   = []

        @response_code = nil
      end

      def get(path:, filters: {})
        if Configuration.invalid_config?(sport, api_name)
          @response = Sports::Butler::ApiBase.invalid_config_result
          @response_code = 400
          return false
        end

        @response           = process_http_party(path, filters)
        @response_code      = response.code
        @success            = true if response_code == 200
        @parsed_response    = process_response(response)

        true
      end

      def process_http_party(path, filters)
        @headers  = Configuration.http_party_headers(sport, api_name)
        @url      = Configuration.http_party_url(path, sport, api_name)
        @query    = filters || {}

        http_party_get
      end

      def process_response(response)
        if response.parsed_response.is_a?(Hash) && response.dig('message')
          error_message(response['message'])
        else
          response.parsed_response
        end
      end

      def error_message(error)
        { message: error }.with_indifferent_access
      end

      def http_party_get
        HTTParty.get(
          "#{url}",
          headers: headers,
          query: query,
          format: :json
        )
      end

      # direct calls
      class << self
        def get(url:, sport: nil, api_name: nil, filters: {}, headers: {})

          if sport && api_name
            if Configuration.invalid_config?(sport, api_name)
              return Sports::Butler::ApiBase.invalid_config_result
            end

            headers  = Configuration.http_party_headers(sport, api_name)
            url      = Configuration.http_party_url_suffix(url, sport, api_name)
          end

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
