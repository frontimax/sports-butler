# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Matches < Sports::Butler::SoccerApi::Matches

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_events
          end

          def filters_by_id(id)
            { match_id: id }
          end
        end
      end
    end
  end
end
