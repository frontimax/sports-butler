# frozen_string_literal: true
require 'httparty'
require 'sports/butler/api'
require "sports/butler/version"
require "sports/butler/configuration"
require "sports/butler/soccer"
require "sports/butler/basketball"

# requires / includes
require 'terminal-table'
require 'term/ansicolor'
include Term::ANSIColor

module Sports
  module Butler

    DEFAULT_SPORT = :soccer
    DEFAULT_API   = :api_football_com

    class << self

      # Sports::Butler Object build
      def new(sport: DEFAULT_SPORT, api_name: DEFAULT_API)
        if Sports::Butler::Configuration.valid_sport_api?(sport, api_name)
          "Sports::Butler::#{sport.to_s.capitalize}".constantize.new(sport: sport, api_name: api_name)
        else
          text_error_sport_api
        end
      end

      # Sports::Butler direct API call without Endpoint Classes
      def get(url:, filters: {})
        Api.get(url: url, filters: filters)
      end

      # Sports::Butler show all endpoints in console output (info)
      def show_endpoints
        puts "\n"

        Configuration::AVAILABLE_SPORT_API.each.with_index(1) do |(sport, api_names), idx|

          print white,  "#{idx}. SPORT: #{sport}\n"
          puts "==============================\n"
          puts "Endpoints for this Sport:\n\n"
          "Sports::Butler::#{sport.to_s.capitalize}::ENDPOINTS".constantize.each.with_index(1) do |endpoint, idx_endpoint|
            row_hash = {}
            row_hash[:available_endpoint_methods] = []
            rows_apis = []


            print white, "#{idx_endpoint}. #{endpoint}\n"

            # get all methods from all apis
            api_names.each.with_index(1) do |api_name, idx_api_name|
              butler = Sports::Butler.new(sport: sport, api_name: api_name)
              available_endpoint_methods = butler.send(endpoint).available_endpoint_methods
              row_hash[:available_endpoint_methods] += available_endpoint_methods
              row_hash[:available_endpoint_methods].uniq!

              rows_apis << api_name
            end

            rows_meths = []
            row_hash[:available_endpoint_methods].each.with_index(1) do |available_endpoint_method, idx_available|
              yes_no = []
              meth_params = []
              api_names.each.with_index(1) do |api_name, idx_api_name|
                butler = Sports::Butler.new(sport: sport, api_name: api_name)
                available_endpoint_methods = butler.send(endpoint).available_endpoint_methods
                res = available_endpoint_methods.include?(available_endpoint_method) ? 'YES' : '-'
                yes_no << res

                if available_endpoint_methods.include?(available_endpoint_method)
                  p = butler.countries.method(available_endpoint_method).parameters
                  res = p.present? ? p : 'none'
                  meth_params << res
                else
                  meth_params << '-'
                end

              end

              # butler.countries.method(:by_name).parameters

              rows_meths << [available_endpoint_method] + yes_no
              rows_meths << [''] + meth_params
              rows_meths << :separator unless idx_available == row_hash[:available_endpoint_methods].size
            end

            table = Terminal::Table.new rows: rows_meths
            table.title = "Endpoint #{endpoint} [#{sport}]"
            table.headings = ['Method'] + rows_apis
            print magenta, table
            print "\n\n"

          end
          puts "\n"

        end

        puts "\n"

        true
      end

      private

      def text_error_sport_api
        text  = "Invalid sport / api parameter. "
        text += "Available sports: #{Sports::Butler::Configuration::AVAILABLE_SPORTS.join(', ')}. "
        text += "Available apis: #{Sports::Butler::Configuration::AVAILABLE_APIS.join(', ')}"
        text
      end
    end
  end
end