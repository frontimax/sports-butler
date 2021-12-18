module Sports
  module Butler
    module Shared
      module AllSports

        # shared endpoints (countries, matches, competitions ...)
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

          filters.merge!({ id: id })
          api.get(path: build_path(path), filters: filters)
          api
        end

        # standings
        def by_competition(competition_id:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ competition_id: competition_id })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def search_by_name(name:, filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ name: name })
          api.get(path: build_path(path), filters: filters)
          api
        end
      end
    end
  end
end
