# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Countries < Sports::Butler::BasketballApi::Countries
          def available_endpoint_methods
            [:all, :by_name, :by_id, :by_code, :search_by_name]
          end

          def filters_search_by_name(name)
            { search: name }
          end
        end
      end
    end
  end
end
