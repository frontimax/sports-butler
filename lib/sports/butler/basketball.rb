# frozen_string_literal: true
require 'sports/butler/base'

module Sports
  module Butler
    class Basketball < Sports::Butler::Base

      ENDPOINTS = [
        :countries,
        :competitions
      ]

      def initialize(sport:, api_name:)
        super
      end

    end
  end
end