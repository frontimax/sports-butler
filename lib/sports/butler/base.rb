# frozen_string_literal: true
require 'sports/butler/soccer_apis/api_football_com/countries'

module Sports
  module Butler
    class Base

      attr_accessor :api,
                    :countries, :areas

      def initialize(api: :api_football_com)
        @countries = Sports::Butler::SoccerApis::ApiFootballCom::Countries.new
        @areas = Sports::Butler::SoccerApis::ApiFootballCom::Countries.new
      end

    end
  end
end