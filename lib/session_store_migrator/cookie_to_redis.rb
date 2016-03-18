require 'redis-session-store'

module SessionStoreMigrator
  class CookieToRedis < ActionDispatch::Session::CookieStore
    def initialize(app, options = {})
      super(app, options[:cookie_store])
      @redis_session_store = RedisSessionStore.new(app, options[:redis_session_store])
    end

    def destroy_session(*args)
      super.tap do
        @redis_session_store.send(:destroy_session, *args)
      end
    end

    def commit_session(*args)
      super.tap do
        @redis_session_store.send(:commit_session, *args)
      end
    end
  end
end
