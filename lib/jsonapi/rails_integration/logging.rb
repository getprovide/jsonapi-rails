module JSONAPI
  module RailsIntegration
    # @private
    module Logging
      def logger
        config[:logger]
      end
    end
  end
end
