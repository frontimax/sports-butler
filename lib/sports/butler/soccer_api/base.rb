# frozen_string_literal: true
require "sports/butler/endpoints"

module Sports
  module Butler
    module SoccerApi
      class Base < Sports::Butler::Endpoints
        def method_missing(method, *args, &block)
          return error_missing_endpoint_method(method)
        end

        def not_found_result(*params)
          error_message("#{params.join(', ')} could not be found.")
        end

        def error_message(error)
          { message: error }.with_indifferent_access
        end
      end
    end
  end
end