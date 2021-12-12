# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Countries < Sports::Butler::BasketballApi::Countries
          def available_endpoint_methods
            [:all, :by_name]
          end
        end
      end
    end
  end
end
