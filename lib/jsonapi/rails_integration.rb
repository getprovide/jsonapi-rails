require 'jsonapi/deserializable'
require 'jsonapi/serializable'
require 'jsonapi/rails_integration/railtie'

module JSONAPI
  module RailsIntegration
    require 'jsonapi/rails_integration/configuration'
    require 'jsonapi/rails_integration/logging'

    extend Configurable
    extend Logging
  end
end
