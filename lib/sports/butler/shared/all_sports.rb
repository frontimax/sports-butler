module Sports
  module Butler
    module Shared
      module AllSports

        def all
          return error_missing_endpoint(__method__) unless available_endpoints.include?(__method__)

          api.get(path: build_path(path))
          api
        end

        def by_name(name: , filters: {})
          return error_missing_endpoint(__method__) unless available_endpoints.include?(__method__)

          filters.merge!({ name: name })
          api.get(path: build_path(path), filters: filters)
          api
        end
      end
    end
  end
end
