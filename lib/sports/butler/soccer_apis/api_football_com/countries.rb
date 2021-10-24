# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApis
      module ApiFootballCom
        class Countries
          PATH = :countries

          def initialize

          end

          # /countries
          def all(result:)
            Api.get(path: PATH, result: result)
          end

        end
      end
    end
  end
end
