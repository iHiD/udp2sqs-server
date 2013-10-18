require "pergo/version.rb"
require "pergo/configuration.rb"
require "pergo/server.rb"

module Udp2sqsServer

  def self.config
    Configuration.instance
  end

end
