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

      def error_missing_endpoint_method(meth)
        "The method '#{meth}' is not available for endpoint '#{self.class.name.demodulize}' in API #{self.api_name}."
      end

      # param names
      def filters_by_match(id)
        { id: id }
      end

      def filters_by_teams(team_id, second_team_id)
        { team_id: team_id, second_team_id: second_team_id }
      end

      def filters_by_id(id)
        { id: id }
      end

      def filters_by_player(id)
        { player: id }
      end
    end
  end
end