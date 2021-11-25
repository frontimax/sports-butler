module Sports
  module Butler
    module Shared
      module AllSports

        def all
          api.get(path: build_path(path))
          api
        end

        def by_name(name: , filters: {})
          filters.merge!({ name: name })
          api.get(path: build_path(path), filters: filters)
          api
        end
      end
    end
  end
end
