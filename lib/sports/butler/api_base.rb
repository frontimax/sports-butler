# frozen_string_literal: true

module Sports
  module Butler
    class ApiBase
      MSG_INVALID_CONFIG  = 'Invalid Configuration, check empty api_token or empty / invalid api_endpoint!'

      class << self
        def not_found_result(*params)
          error_message("#{params.join(', ')} could not be found.")
        end

        def invalid_config_result
          error_message(MSG_INVALID_CONFIG)
        end

        def unsupported_api_call(klass, method)
          message  = "Method '#{method}' is not supported for the endpoint '#{klass}' by this API: "
          message += "#{Configuration.api_name}"
          error_message(message)
        end

        def unsupported_api_endpoint(klass)
          error_message("The Endpoint '#{klass}' is not supported by this API: #{Configuration.api_name}")
        end

        def error_message(error)
          { message: error }.with_indifferent_access
        end

      end
    end
  end
end
