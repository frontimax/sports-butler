# frozen_string_literal: true

## SOCCER
require 'sports/butler/soccer_api/base'
require 'sports/butler/soccer_api/countries'
require 'sports/butler/soccer_api/competitions'
# api_football_com
require 'sports/butler/soccer_api/api_football_com/countries'
require 'sports/butler/soccer_api/api_football_com/competitions'
# football_data_org
require 'sports/butler/soccer_api/football_data_org/countries'
require 'sports/butler/soccer_api/football_data_org/competitions'
# apifootball_com
require 'sports/butler/soccer_api/apifootball_com/base'
require 'sports/butler/soccer_api/apifootball_com/countries'
require 'sports/butler/soccer_api/apifootball_com/competitions'


## BASKETBALL
require 'sports/butler/basketball_api/base'
require 'sports/butler/basketball_api/countries'
require 'sports/butler/basketball_api/competitions'
# api_basketball_com
require 'sports/butler/basketball_api/api_basketball_com/countries'
require 'sports/butler/basketball_api/api_basketball_com/competitions'

module Sports
  module Butler
    class Base

      ENDPOINTS = [
        :countries, :competitions
      ]

      ALIASES = {
        areas: :countries,
        leagues: :competitions
      }

      attr_accessor :sport, :api_name, :api_class, :sport_class,
                    :api, :endpoint

      def initialize(sport:, api_name:)
        @sport        = sport
        @api_name     = api_name
        @api_class    = api_name.to_s.camelize
        @sport_class  = "#{sport.to_s.camelize}Api"

        build_api_object
        #build_endpoint_objects
      end

      def method_missing(method, *args, &block)
        endpoint_name = eval_endpoint_name(method)
        if endpoint_name.present? && Kernel.const_defined?("#{scope}::#{endpoint_name.capitalize}")
          @endpoint = build_endpoint_classes(endpoint_name.capitalize)
        else
          raise endpoint_not_available(method)
        end
      end

      private

      def eval_endpoint_name(endpoint_name)
        if ENDPOINTS.include?(endpoint_name)
          endpoint_name
        elsif ALIASES[endpoint_name].present?
          ALIASES[endpoint_name]
        end
      end

      def scope
        "Sports::Butler::#{sport_class}::#{api_class}"
      end

      def build_api_object
        @api = Api.new(sport, api_name)
      end

      def build_endpoint_classes(name)
        "#{scope}::#{name}".constantize.new(sport: sport, api_name: api_name, api: api)
      end

      def endpoint_not_available(name)
        "NOT AVAILABLE: the endpoint '#{name}' is not available for this sport/api combination. API"
      end
    end
  end
end