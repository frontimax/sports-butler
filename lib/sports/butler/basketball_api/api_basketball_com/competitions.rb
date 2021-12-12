# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Competitions < Sports::Butler::BasketballApi::Competitions
          def available_endpoint_methods
            [:all, :by_id]
          end

          def path
            :leagues
          end

        end
      end
    end
  end
end
