# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Countries < Sports::Butler::SoccerApi::ApifootballCom::Base
          PATH = :get_countries


          def all
            api.get(path: build_path(PATH))
            api
          end

          def by_name(name: , filters: {})
            filters.merge!({ name: name })

            api.get(path: build_path(PATH), filters: filters)
            api
          end

        end
      end
    end
  end
end
