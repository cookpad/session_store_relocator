require 'mock_redis'

module SessionStoreMigratorTestHelper
  def redis
    @mock_redis ||= MockRedis.new
  end
  module_function :redis
end
