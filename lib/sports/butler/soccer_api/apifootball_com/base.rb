# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Base < Sports::Butler::SoccerApi::Base

          def build_path(action)
            "action=#{action}"
          end
        end
      end
    end
  end
end