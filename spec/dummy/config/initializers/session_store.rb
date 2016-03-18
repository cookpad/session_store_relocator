Rails.application.config.session_store SessionStoreMigrator::CookieToRedis, {
  cookie_store: {key: '_dummy_session'},
  redis_session_store: {
    key_prefix: 'dummy_session:',
    redis: { client: SessionStoreMigratorTestHelper.redis },
    serializer: :json,
  }
}
