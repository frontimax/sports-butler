# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Matches < Sports::Butler::SoccerApi::Matches
          require 'sports/butler/soccer_api/football_data_org/base'
          include Sports::Butler::SoccerApi::FootballDataOrg::Base

          STATUS_FINISHED   = 'FINISHED'
          STATUS_SCHEDULED  = 'SCHEDULED'

          def available_endpoint_methods
            [
              :by_id, :all, :by_competition, :by_competition_and_year, :by_team, :by_team_and_status,
              :by_team_finished, :by_team_scheduled
            ]
          end

          def by_id(id:, filters: {})
            api_with_id(id, filters)
          end

          def by_competition(competition_id:, filters: {})
            api.get(path: "competitions/#{competition_id}/#{path}", filters: filters)
            api
          end

          def by_competition_and_year(competition_id:, year:, filters: {})
            filters.merge!({ season: year })
            api.get(path: "competitions/#{competition_id}/#{path}", filters: filters)
            api
          end

          def by_team(team_id:, filters: {})
            api.get(path: "teams/#{team_id}/#{path}", filters: filters)
            api
          end

          def by_team_and_status(team_id:, status:, filters: {})
            filters.merge!({ status: status })
            api.get(path: "teams/#{team_id}/#{path}", filters: filters)
            api
          end

          def by_team_finished(team_id:, filters: {})
            by_team_and_status(team_id: team_id, status: STATUS_FINISHED, filters: filters)
          end

          def by_team_scheduled(team_id:, filters: {})
            by_team_and_status(team_id: team_id, status: STATUS_SCHEDULED, filters: filters)
          end
        end
      end
    end
  end
end
