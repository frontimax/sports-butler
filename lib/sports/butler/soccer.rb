# frozen_string_literal: true
require 'sports/butler/base'

module Sports
  module Butler
    class Soccer < Sports::Butler::Base

      def initialize(api: :api_football_com)
        super
      end

    end
  end
end