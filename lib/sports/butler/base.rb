# frozen_string_literal: true

## SOCCER
require 'sports/butler/soccer_api/base'
require 'sports/butler/soccer_api/countries'
require 'sports/butler/soccer_api/competitions'
require 'sports/butler/soccer_api/matches'
require 'sports/butler/soccer_api/standings'
require 'sports/butler/soccer_api/teams'
require 'sports/butler/soccer_api/players'
require 'sports/butler/soccer_api/head_to_head'
require 'sports/butler/soccer_api/lineups'
require 'sports/butler/soccer_api/odds'
require 'sports/butler/soccer_api/scorers'
# api_football_com
require 'sports/butler/soccer_api/api_football_com/countries'
require 'sports/butler/soccer_api/api_football_com/competitions'
require 'sports/butler/soccer_api/api_football_com/matches'
require 'sports/butler/soccer_api/api_football_com/standings'
require 'sports/butler/soccer_api/api_football_com/teams'
require 'sports/butler/soccer_api/api_football_com/players'
require 'sports/butler/soccer_api/api_football_com/head_to_head'
require 'sports/butler/soccer_api/api_football_com/lineups'
require 'sports/butler/soccer_api/api_football_com/odds'
require 'sports/butler/soccer_api/api_football_com/scorers'
# football_data_org
require 'sports/butler/soccer_api/football_data_org/countries'
require 'sports/butler/soccer_api/football_data_org/competitions'
require 'sports/butler/soccer_api/football_data_org/matches'
require 'sports/butler/soccer_api/football_data_org/standings'
require 'sports/butler/soccer_api/football_data_org/teams'
require 'sports/butler/soccer_api/football_data_org/players'
require 'sports/butler/soccer_api/football_data_org/head_to_head'
require 'sports/butler/soccer_api/football_data_org/lineups'
require 'sports/butler/soccer_api/football_data_org/odds'
require 'sports/butler/soccer_api/football_data_org/scorers'
# apifootball_com
require 'sports/butler/soccer_api/apifootball_com/countries'
require 'sports/butler/soccer_api/apifootball_com/competitions'
require 'sports/butler/soccer_api/apifootball_com/matches'
require 'sports/butler/soccer_api/apifootball_com/standings'
require 'sports/butler/soccer_api/apifootball_com/teams'
require 'sports/butler/soccer_api/apifootball_com/players'
require 'sports/butler/soccer_api/apifootball_com/head_to_head'
require 'sports/butler/soccer_api/apifootball_com/lineups'
require 'sports/butler/soccer_api/apifootball_com/odds'
require 'sports/butler/soccer_api/apifootball_com/scorers'

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
        leagues: :competitions,
        events: :matches,
        fixtures: :matches,
        top_scorers: :scorers
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
            @endpoints[method] : @endpoints[method] = build_endpoint_classes(endpoint_name)
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
        Kernel.const_defined?( "#{scope}::#{endpoint.to_s.camelize}") ? endpoint.to_s.camelize : nil
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