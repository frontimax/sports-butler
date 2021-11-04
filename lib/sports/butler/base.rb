# frozen_string_literal: true

## SOCCER
require 'sports/butler/soccer_api/base'
# api_football_com
require 'sports/butler/soccer_api/api_football_com/countries'
# football_data_org
require 'sports/butler/soccer_api/football_data_org/countries'
# apifootball_com
require 'sports/butler/soccer_api/apifootball_com/base'
require 'sports/butler/soccer_api/apifootball_com/countries'


module Sports
  module Butler
    class Base

      ENDPOINTS = {
        countries: [
                     :countries, :areas
                   ]
      }

      attr_accessor :sport, :api,:api_class, :sport_class,
                    :countries, :areas

      def initialize(sport:, api:)
        @sport  = sport
        @api    = api
        @api_class    = api.to_s.camelize
        @sport_class  = "#{sport.to_s.camelize}Api"

        # @configuration = Configuration

        build_endpoint_objects
      end

      private

      def scope
        "Sports::Butler::#{sport_class}::#{api_class}"
      end

      def build_endpoint_objects
        ENDPOINTS.each do |endpoint, aliases|
          aliases.each do |alias_name|
            send("#{alias_name}=", build_endpoint_classes(endpoint.capitalize))
          end
        end
      end

      def build_endpoint_classes(name)
        # TODO: what if nil? universal error message on all methods (catch undefined method object!)
        "#{scope}::#{name}".constantize.new(sport, api) if Kernel.const_defined?("#{scope}::#{name}")
      end
    end
  end
end