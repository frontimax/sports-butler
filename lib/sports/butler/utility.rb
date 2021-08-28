# frozen_string_literal: true
# requires / includes
require 'terminal-table'
require 'term/ansicolor'
include Term::ANSIColor

module Sports
  module Butler
    class Utility

      class << self
        def endpoints
          linebreak

          Configuration::AVAILABLE_SPORT_API.each.with_index(1) do |(sport, api_names), idx|

            print white,  "#{idx}. SPORT: #{sport}\n"
            puts "==============================\n"
            puts "Endpoints for this Sport:\n\n"

            all_endpoints = "Sports::Butler::#{sport.to_s.capitalize}::ENDPOINTS".constantize
            all_endpoints.sort.each.with_index(1) do |endpoint, idx_endpoint|
              row_hash = {}
              row_hash[:available_endpoint_methods] = []
              rows_apis = []

              aliases = Sports::Butler::Base::ALIASES.map{ |key, value| key if value == endpoint }.compact
              print white, "#{idx_endpoint}. #{endpoint} [ Aliases: #{aliases.present? ? aliases.join(', ') : '-'} ]\n"

              # get all methods from all apis
              api_names.each.with_index(1) do |api_name, _idx_api_name|
                butler = Sports::Butler.new(sport: sport, api_name: api_name)

                next unless butler.available_endpoints.include?(endpoint.to_s)
                available_endpoint_methods = butler.send(endpoint).available_endpoint_methods

                row_hash[:available_endpoint_methods] += available_endpoint_methods
                row_hash[:available_endpoint_methods].uniq!

                rows_apis << api_name
              end

              rows_meths = []
              row_hash[:available_endpoint_methods].each.with_index(1) do |available_endpoint_method, idx_available|
                yes_no = []
                meth_params = []
                api_names.each.with_index(1) do |api_name, _idx_api_name|
                  butler = Sports::Butler.new(sport: sport, api_name: api_name)

                  next unless butler.available_endpoints.include?(endpoint.to_s)
                  available_endpoint_methods = butler.send(endpoint).available_endpoint_methods

                  res = available_endpoint_methods.include?(available_endpoint_method) ? 'YES' : '-'
                  yes_no << res

                  if available_endpoint_methods.include?(available_endpoint_method)
                    params = butler.send(endpoint).method(available_endpoint_method).parameters

                    res = params.present? ? params : 'none'
                    meth_params << res
                  else
                    meth_params << '-'
                  end
                end

                rows_meths << [available_endpoint_method] + yes_no
                rows_meths << [''] + meth_params
                rows_meths << :separator unless idx_available == row_hash[:available_endpoint_methods].size
              end

              table = Terminal::Table.new rows: rows_meths
              table.title = "Endpoint #{endpoint} [#{sport}]"
              table.headings = ['Method'] + rows_apis

              print magenta, table

              linebreak
              linebreak
            end
            linebreak
          end
          linebreak

          true
        end

        # output
        def linebreak
          puts "\n"
        end

      end

    end
  end
end