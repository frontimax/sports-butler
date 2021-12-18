# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Competitions < Sports::Butler::SoccerApi::Competitions

          def available_endpoint_methods
            [:all, :by_id]
          end


          def by_id(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            api
          end
        end
      end
    end
  end
end
