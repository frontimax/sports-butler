# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Countries < Sports::Butler::SoccerApi::Countries
          #PATH = :areas

          def path
            :areas
          end

          # def by_name(name: , filters: {})
          #   filters.merge!({ name: name })
          #
          #   api.get(path: PATH, filters: filters)
          #   api
          # end

        end
      end
    end
  end
end
