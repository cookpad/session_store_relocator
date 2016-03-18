require 'mock_redis'

module SessionStoreRelocatorTestHelper
  def redis
    @mock_redis ||= MockRedis.new
  end
  module_function :redis
end
