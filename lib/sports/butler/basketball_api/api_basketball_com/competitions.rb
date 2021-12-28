# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Competitions < Sports::Butler::BasketballApi::Competitions
          def available_endpoint_methods
            [:all, :by_id, :by_name, :by_country_name, :by_country, :cups, :leagues, :by_season]
          end

          def path
            :leagues
          end
        end
      end
    end
  end
end
