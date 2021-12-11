# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Competitions < Sports::Butler::BasketballApi::Competitions
          def path
            :leagues
          end

        end
      end
    end
  end
end
