# frozen_string_literal: true
module Sports
  module Butler
    class Endpoints
      require 'sports/butler/shared/all_sports'

      include Sports::Butler::Shared::AllSports

      attr_accessor :sport, :api_name, :api

      def initialize(sport:, api_name:, api:)
        @sport    = sport
        @api_name = api_name
        @api      = api
      end

      def build_path(_action)
        path
      end
    end
  end
end