# frozen_string_literal: true
# requires / includes
require 'terminal-table'
require 'term/ansicolor'
include Term::ANSIColor

module Sports
  module Butler
    class Utility

      class << self
        def endpoints(dev_mode: false)
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
                if dev_mode && !butler.valid_configuration
                  print red, "\nINVALID CONFIGURATION for #{sport}.#{api_name} - skipping ...\n"
                  next
                end

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
                  if dev_mode && !butler.valid_configuration
                    print red, "\nINVALID CONFIGURATION for #{sport}.#{api_name} - skipping ...\n"
                    next
                  end

                  next unless butler.available_endpoints.include?(endpoint.to_s)
                  available_endpoint_methods = butler.send(endpoint).available_endpoint_methods

                  res = available_endpoint_methods.include?(available_endpoint_method) ? 'YES' : '-'
                  yes_no << res

                  if available_endpoint_methods.include?(available_endpoint_method)
                    params = butler.send(endpoint).method(available_endpoint_method).parameters

                    if dev_mode
                      required = params.select{ |param| param.first == :keyreq }
                      cmd_string = "butler.#{endpoint}.#{available_endpoint_method}(#{required.map{ |key_req| "#{key_req.second}: 111" }.join(', ')})"
                      cmd_string += ".success"
                      print white, cmd_string

                      success =  eval(cmd_string)
                      if success
                        print green, "\nSUCCESS > #{sport}.#{api_name}\n"
                      else
                        api = eval("butler.#{endpoint}.api")
                        if  api.parsed_response.is_a?(Hash) && api.response.dig('message')
                          print yellow, "\nSUCCESS with error message> #{sport}.#{api_name}: #{api.response['message']}\n"
                        else
                          print red, "\nFAILED! > #{sport}.#{api_name}: #{api.response_code} > #{api.uri}\n"
                        end
                      end
                    end

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

              print magenta, table unless dev_mode

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