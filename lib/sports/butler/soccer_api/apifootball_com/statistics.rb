# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Statistics < Sports::Butler::SoccerApi::Statistics
          def path
            :get_statistics
          end

          def build_path(action)
            "action=#{action}"
          end
        end
      end
    end
  end
end
