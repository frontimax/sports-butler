# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Odds < Sports::Butler::BasketballApi::Odds

          def filters_by_match(id)
            { game: id }
          end

        end
      end
    end
  end
end
