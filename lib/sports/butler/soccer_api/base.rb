# frozen_string_literal: true
require "sports/butler/endpoints"

module Sports
  module Butler
    module SoccerApi
      class Base < Sports::Butler::Endpoints
        def method_missing(method, *args, &block)
          return error_missing_endpoint_method(method)
        end
      end
    end
  end
end