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

      ALIASES = {
        areas: :countries,
        leagues: :competitions
      }

      attr_accessor :sport, :api_name, :api_class, :sport_class,
                    :endpoints, :available_endpoint_methods

      def initialize(sport:, api_name:)
        @sport        = sport
        @api_name     = api_name
        @api_class    = api_name.to_s.camelize
        @sport_class  = "#{sport.to_s.camelize}Api"

        @endpoints    = {}

        @available_endpoint_methods  = get_available_endpoint_methods
      end

      def method_missing(method, *args, &block)
        endpoint_name = eval_endpoint_name(method)
        if endpoint_name.present?
          @endpoints[method].present? ?
            @endpoints[method] : @endpoints[method] = build_endpoint_classes(endpoint_name.capitalize)
        else
          # TODO: error class with own method_missing!
          raise endpoint_not_available(method)
        end
      end

      private

      # TODO! all files of dir > classes & methods!
      def get_available_endpoint_methods
        []
      end

      def eval_endpoint_name(endpoint_name)
        endpoint = ALIASES[endpoint_name].present? ? ALIASES[endpoint_name] : endpoint_name
        Kernel.const_defined?("#{scope}::#{endpoint.capitalize}") ? endpoint : nil
      end

      def scope
        "Sports::Butler::#{sport_class}::#{api_class}"
      end

      def build_api_object
        Api.new(sport, api_name)
      end

      def build_endpoint_classes(name)
        "#{scope}::#{name}".constantize.new(sport: sport, api_name: api_name, api: build_api_object)
      end

      def endpoint_not_available(name)
        "NOT AVAILABLE: the endpoint '#{name}' is not available for this sport/api combination."
      end
    end
  end
end