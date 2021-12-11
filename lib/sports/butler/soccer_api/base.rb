# frozen_string_literal: true
require "sports/butler/endpoints"

module Sports
  module Butler
    module SoccerApi
      class Base < Sports::Butler::Endpoints

        def error_missing_endpoint(endpoint)
          "The endpoint '#{endpoint}' is not available for this API."
        end
      end
    end
  end
end