# frozen_string_literal: true
require 'sports/butler/base'

module Sports
  module Butler
    class Basketball < Sports::Butler::Base

      ENDPOINTS = [
        :countries,
        :competitions,
        :matches,
        :odds,
        :seasons,
        :standings,
        :statistics,
        :teams,
        :timezones
      ]

      def initialize(sport:, api_name:)
        super
      end

    end
  end
end