# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Base

        attr_accessor :sport, :api_name, :api

        def initialize(sport, api_name)
          @sport = sport
          @api_name = api_name

          @api = Api.new(sport, api_name)
        end
      end
    end
  end
end