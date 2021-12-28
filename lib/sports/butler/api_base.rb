# frozen_string_literal: true

module Sports
  module Butler
    class ApiBase
      MSG_INVALID_CONFIG  = 'Invalid Configuration, check empty api_token or empty / invalid api_endpoint!'

      class << self
        def invalid_config_result
          error_message(MSG_INVALID_CONFIG)
        end

        def error_message(error)
          { message: error }.with_indifferent_access
        end
      end
    end
  end
end
