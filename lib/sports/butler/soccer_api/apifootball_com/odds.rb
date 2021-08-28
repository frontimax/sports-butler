# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Odds < Sports::Butler::SoccerApi::Odds
          def path
            :get_odds
          end

          def build_path(action)
            "action=#{action}"
          end

          def filters_by_match(id)
            { match_id: id }
          end

        end
      end
    end
  end
end
