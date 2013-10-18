require 'propono'

module Pergo
  class Server

    def self.run(*args)
      new(*args).run
    end

    def initialize(options = {})
      @host = options.fetch(:host, "0.0.0.0")
      @port = options.fetch(:port, 9732)

      Propono.config.access_key = config.access_key
      Propono.config.secret_key = config.secret_key
      Propono.config.queue_region = config.queue_region
      Propono.config.udp_host = config.host
      Propono.config.udp_port = config.port
    end

    def run
      Propono.listen_to_udp do |text|
        Propono.publish(config.topic, text)
      end
    end

    private

    def config
      Configuration.instance
    end
  end
end


