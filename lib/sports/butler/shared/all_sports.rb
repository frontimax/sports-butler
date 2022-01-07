module Sports
  module Butler
    module Shared
      module AllSports

        def all(filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_name(name: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ name: name })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_country_name(country_name: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ country: country_name })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_id(id: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_by_id(id))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_match(match_id: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_by_match(match_id))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_country(country_id: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ country_id: country_id })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_competition(competition_id:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_by_competition(competition_id))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def search_by_name(name:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_search_by_name(name))
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

          filters.merge!(filters_by_team(team_id))
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

        def by_competition_and_year(competition_id:, year:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!(filters_by_competition_and_year(competition_id, year))
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_teams(team_id:, second_team_id:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

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

        def by_season(season:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ season: season })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_code(code: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ code: code })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def by_competition_and_team_and_season(competition_id:, team_id:, season: , filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ league: competition_id, team: team_id, season: season })
          api.get(path: build_path(path), filters: filters)
          api
        end
      end
    end
  end
end
