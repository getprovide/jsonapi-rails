module WithConfig
  def with_config(hash)
    JSONAPI::RailsIntegration.configure do |config|
      config.merge!(hash)
    end
    yield
    JSONAPI::RailsIntegration.configure do |config|
      config.clear
    end
  end
end
