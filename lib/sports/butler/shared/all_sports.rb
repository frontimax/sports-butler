module Sports
  module Butler
    module Shared
      module AllSports

        def all
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          api.get(path: build_path(path))
          api
        end

        def by_name(name: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ name: name })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_id(id: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_by_id(id))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_match(id: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_by_match(id))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_competition(id:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ competition_id: id })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def search_by_name(name:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ name: name })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_player(player_id:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_by_player(player_id))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_team(team_id:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ team: team_id })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_coach(coach_id:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ coach: coach_id })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_id_and_season(id:, season:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ id: id, season: season })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_competition_and_year(id:, year:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ league: id, season: year })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_teams(team_id:, second_team_id:, filters: {})
          filters.merge!(filters_by_teams(team_id, second_team_id))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_competition_and_season(competition_id:, season:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ league: competition_id, season: season })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_team_and_season(team_id:, season:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ team: team_id, season: season })
          api.get(path: build_path(path), filters: filters)
          api
        end
      end
    end
  end
end
