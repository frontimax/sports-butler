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

          filters.merge!({ id: id })
          api.get(path: build_path(path), filters: filters)
          api
        end

        # countries
        #  def by_code(code:, result: api_switch_result, filters: {})
        #           api_switch_method(__method__, { code: code, result: result, filters: filters })
        #         end
        #
        #         def search_by_name(name:, result: api_switch_result, filters: {})
        #           api_switch_method(__method__, { name: name, result: result, filters: filters })
        #         end
        #
        # competitions
        #
      end
    end
  end
end
