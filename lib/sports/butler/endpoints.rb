# frozen_string_literal: true
module Sports
  module Butler
    class Endpoints
      require 'sports/butler/shared/all_sports'
      require 'sports/butler/shared/api_coms'

      include Sports::Butler::Shared::AllSports
      include Sports::Butler::Shared::ApiComs

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

      def filters_by_team(team_id)
        { team: team_id }
      end

      def filters_by_id(id)
        { id: id }
      end

      def filters_by_player(id)
        { player: id }
      end

      def filters_by_competition(id)
        { competition_id: id }
      end

      def filters_by_competition_and_year(id, year)
        { league: id, season: year }
      end

      def filters_search_by_name(name)
        { name: name }
      end
    end
  end
end