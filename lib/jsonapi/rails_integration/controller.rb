require 'jsonapi/rails_integration/controller/deserialization'
require 'jsonapi/rails_integration/controller/hooks'

module JSONAPI
  module RailsIntegration
    # ActionController methods and hooks for JSON API deserialization and
    #   rendering.
    module Controller
      include Deserialization
      include Hooks
    end
  end
end
