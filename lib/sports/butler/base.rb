# frozen_string_literal: true

## SOCCER
Dir.glob(File.expand_path("../soccer_api/*.rb", __FILE__)).each do |file|
  require file
end

# api_football_com
Dir.glob(File.expand_path("../soccer_api/api_football_com/*.rb", __FILE__)).each do |file|
  require file
end

# football_data_org
Dir.glob(File.expand_path("../soccer_api/football_data_org/*.rb", __FILE__)).each do |file|
  require file
end

# apifootball_com
Dir.glob(File.expand_path("../soccer_api/apifootball_com/*.rb", __FILE__)).each do |file|
  require file
end

## BASKETBALL
Dir.glob(File.expand_path("../basketball_api/*.rb", __FILE__)).each do |file|
  require file
end

# api_basketball_com
Dir.glob(File.expand_path("../basketball_api/api_basketball_com/*.rb", __FILE__)).each do |file|
  require file
end

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

      AVAILABLE_ENDPOINTS = {}
      AVAILABLE_ENDPOINTS = {
        soccer: {},
        basketball: {}
      }

      AVAILABLE_ENDPOINTS[:soccer][:api_football_com] = Dir.
        glob(File.expand_path("../soccer_api/api_football_com/*.rb", __FILE__))
      AVAILABLE_ENDPOINTS[:soccer][:apifootball_com] = Dir.
        glob(File.expand_path("../soccer_api/apifootball_com/*.rb", __FILE__))
      AVAILABLE_ENDPOINTS[:soccer][:football_data_org] = Dir.
        glob(File.expand_path("../soccer_api/football_data_org/*.rb", __FILE__))

      AVAILABLE_ENDPOINTS[:basketball][:api_basketball_com] = Dir.
        glob(File.expand_path("../basketball_api/api_basketball_com/*.rb", __FILE__))

      attr_accessor :sport, :api_name, :api_class, :sport_class,
                    :endpoints, :available_endpoints, :valid_configuration

      def initialize(sport:, api_name:)
        @sport        = sport
        @api_name     = api_name
        @api_class    = api_name.to_s.camelize
        @sport_class  = "#{sport.to_s.camelize}Api"

        @endpoints    = {}

        @available_endpoints  = get_available_endpoints
        @valid_configuration  = !Configuration.invalid_config?(sport, api_name)
      end

      def method_missing(method, *args, &block)
        endpoint_name = eval_endpoint_name(method)
        if endpoint_name.present?
          @endpoints[method].present? ?
            @endpoints[method] : @endpoints[method] = build_endpoint_classes(endpoint_name)
        else
          raise MissingEndpoint, endpoint_not_available(method)
        end
      end

      private

      def get_available_endpoints
        result = {}.with_indifferent_access

        AVAILABLE_ENDPOINTS[sport][api_name].each do |path|
          next if File.basename(path, ".*") == 'base'

          endpoint = File.basename(path, ".*")
          endpoint_methods = self.send(endpoint).available_endpoint_methods

          result_endpoints = {}.with_indifferent_access
          endpoint_methods.each do |endpoint_method|
            result_endpoints[endpoint_method] = self.send(endpoint).method(endpoint_method).parameters
          end

          result[endpoint] = result_endpoints
        end

        result
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

    class MissingEndpoint < StandardError
      def initialize(msg)
        super
      end
    end
  end
end