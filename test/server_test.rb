require File.expand_path('../test_helper', __FILE__)

module Pergo
  class ServerTest < Minitest::Test

    def test_initialization
      server = Server.new
      assert_equal "0.0.0.0",           server.instance_variable_get("@host")
      assert_equal 9732,                server.instance_variable_get("@port")
      assert_equal config.access_key,   Propono.config.access_key
      assert_equal config.secret_key,   Propono.config.secret_key
      assert_equal config.queue_region, Propono.config.queue_region
    end

    def test_listen_to_sqs_in_called
      Propono.expects(:listen_to_udp)
      Server.run
    end
  end
end
