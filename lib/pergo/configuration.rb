require 'singleton'

module Pergo

  class ConfigurationError < Exception
  end

  class Configuration
    include Singleton

    SETTINGS = [
      :access_key, :secret_key, :queue_region, 
      :topic, 
      :host, :port
    ]
    attr_writer *SETTINGS

    SETTINGS.each do |setting|
      define_method setting do
        get_or_raise(setting)
      end
    end

    private

    def get_or_raise(setting)
      instance_variable_get("@#{setting.to_s}") || 
        raise(ConfigurationError.new("Configuration for #{setting} is not set"))
    end
  end
end


