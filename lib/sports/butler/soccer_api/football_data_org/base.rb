# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        module Base
          def path_with_id(id)
            "#{path}/#{id}"
          end

          def api_with_id(id, filters)
            api.get(path: path_with_id(id), filters: filters)
            api
          end
        end
      end
    end
  end
end
