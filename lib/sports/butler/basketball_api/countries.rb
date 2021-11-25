# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Countries < Sports::Butler::BasketballApi::Base
        #include Sports::Butler::Shared::AllSports

        def path
          :countries
        end

      end
    end
  end
end