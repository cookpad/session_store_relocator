Rails.application.config.session_store SessionStoreMigrator::CookieToRedis, {
  source: {key: '_dummy_session'},
  destination: {
    key_prefix: 'dummy_session:',
    redis: { client: SessionStoreMigratorTestHelper.redis },
    serializer: :json,
  }
}
