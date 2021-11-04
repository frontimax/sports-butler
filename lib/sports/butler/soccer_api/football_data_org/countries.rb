# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Countries < Sports::Butler::SoccerApi::Base
          PATH = :areas

          def all
            api.get(path: PATH)
            api
          end

          def by_name(name: , filters: {})
            filters.merge!({ name: name })

            api.get(path: PATH, filters: filters)
            api
          end

        end
      end
    end
  end
end
