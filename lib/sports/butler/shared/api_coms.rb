module Sports
  module Butler
    module Shared
      module ApiComs

        def leagues(filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ type: 'league' })
          api.get(path: build_path(path), filters: filters)
          api
        end

        def cups(filters: {})
          return error_missing_endpoint_method(__method__) unless available_endpoint_methods.include?(__method__)

          filters.merge!({ type: 'cup' })
          api.get(path: build_path(path), filters: filters)
          api
        end
      end
    end
  end
end
