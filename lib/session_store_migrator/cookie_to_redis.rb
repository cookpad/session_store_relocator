require 'redis-session-store'

module SessionStoreMigrator
  class CookieToRedis < ActionDispatch::Session::CookieStore
    def initialize(app, options = {})
      super(app, options[:source])
      @destination = RedisSessionStore.new(app, options[:destination])
    end

    def destroy_session(*args)
      super.tap do
        @destination.send(:destroy_session, *args)
      end
    end

    def set_session(*args, &block)
      super.tap do
        @destination.send(:set_session, *args)
      end
    end

    def commit_session(*args)
      super.tap do
        @destination.send(:commit_session, *args)
      end
    end
  end
end
