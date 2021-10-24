# frozen_string_literal: true

module Sports
  module Butler
    module Configuration
      # Sports
      AVAILABLE_SPORTS = [:soccer, :basketball]

      # APIs
      AVAILABLE_APIS = [
        # Soccer
        :football_data_org, :apifootball_com, :api_football_com,
        # Basketball
        :api_basketball_com
      ]

      class << self
        def valid_sport?(sport)
          AVAILABLE_SPORTS.include?(sport.to_sym)
        end

        def valid_api?(api)
          AVAILABLE_APIS.include?(api.to_sym)
        end

        def valid_sport_api?(sport, api)
          valid_sport?(sport) && valid_api?(api)
        end
      end
    end
  end
end