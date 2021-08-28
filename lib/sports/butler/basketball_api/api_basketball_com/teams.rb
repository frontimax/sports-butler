# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Teams < Sports::Butler::BasketballApi::Teams

          def filters_search_by_name(name)
            { search: name }
          end

          def filters_by_competition(id)
            { league: id }
          end
        end
      end
    end
  end
end
