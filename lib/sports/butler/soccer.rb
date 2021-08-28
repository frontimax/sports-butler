# frozen_string_literal: true
require 'sports/butler/base'

module Sports
  module Butler
    class Soccer < Sports::Butler::Base

      ENDPOINTS = [
        :countries,
        :competitions,
        :matches,
        :teams,
        :players,
        :head_to_head,
        :lineups,
        :odds,
        :scorers,
        :standings,
        :coachs,
        :injuries,
        :predictions,
        :sidelineds,
        :statistics,
        :timezones,
        :transfers,
        :trophies,
        :venues
      ]

      def initialize(sport:, api_name:)
        super
      end

    end
  end
end