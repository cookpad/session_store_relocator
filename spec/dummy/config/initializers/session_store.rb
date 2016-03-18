Rails.application.config.session_store SessionStoreRelocator::CookieToRedis, {
  cookie_store: {key: '_dummy_session'},
  redis_session_store: {
    key_prefix: 'dummy_session:',
    redis: { client: SessionStoreRelocatorTestHelper.redis },
    serializer: :json,
  }
}
