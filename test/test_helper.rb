#require "codeclimate-test-reporter"
#CodeClimate::TestReporter.start

gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "minitest/mock"
require "mocha/setup"

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "pergo"

#Fog.mock!

class Minitest::Test
  def setup
    Pergo::Configuration.instance.access_key = "test-access-key"
    Pergo::Configuration.instance.secret_key = "test-secret-key"
    Pergo::Configuration.instance.topic = "test-topic"
    Pergo::Configuration.instance.queue_region = "test-queue-region"
    Pergo::Configuration.instance.host = "http://udp.example.com"
    Pergo::Configuration.instance.port = 1234
  end

  def config
    Pergo::Configuration.instance
  end
end

