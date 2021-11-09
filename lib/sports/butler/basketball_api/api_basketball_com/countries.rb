# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Countries < Sports::Butler::BasketballApi::Countries

          # /countries?name={name}
          def by_name(name: , filters: {})
            filters.merge!({ name: name })

            api.get(path: PATH, filters: filters)
            api
          end

        end
      end
    end
  end
end
