require 'test_helper'

module Monitr

  class MonitrTest < Test::Unit::TestCase

    context "Monitr" do

      setup do
        @server = Server.new
      end

      should "return system info" do
        assert_not_nil     @server.system
        assert_equal 1,    @server.system.monitored
        assert_equal 'myapplication.cz', @server.system.name
        assert_equal 5.28, @server.system.load
        assert_equal 0,    @server.system.status
      end

      should "return filesystems info" do
        assert_not_nil @server.filesystems
        assert_equal 4, @server.filesystems.size

        filesystem = @server.filesystems.first
        assert_not_nil filesystem
        assert_equal 1, filesystem.monitored
        assert_equal 22.8, filesystem.percent
      end

      should "return processes info" do
        assert_not_nil @server.processes
        assert_equal 15, @server.processes.size

        thin = @server.processes.first
        assert_not_nil thin
        assert_equal 1, thin.monitored
        assert_equal 1, thin.memory
        assert_equal 0, thin.cpu
      end

    end

  end

end
