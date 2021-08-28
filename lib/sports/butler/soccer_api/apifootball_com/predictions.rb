# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Predictions < Sports::Butler::SoccerApi::Predictions
          def path
            :get_predictions
          end

          def build_path(action)
            "action=#{action}"
          end
        end
      end
    end
  end
end
