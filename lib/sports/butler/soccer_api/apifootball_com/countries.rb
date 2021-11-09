# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Countries < Sports::Butler::SoccerApi::Countries
          def path
            :get_countries
          end

          # def by_name(name: , filters: {})
          #   filters.merge!({ name: name })
          #
          #   api.get(path: build_path(PATH), filters: filters)
          #   api
          # end

        end
      end
    end
  end
end
