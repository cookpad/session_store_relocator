# SessionStoreMigrator

Supports session store relocation with temporary write session data to multiple store.

Currently supports from Rails default ActionDispatch::Session::CookieStore to [RedisSessionStore](https://github.com/roidrage/redis-session-store).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'session_store_relocator'
```

And then execute:

    $ bundle

## Usage

This gem helps relocating session store by write data to both stores.
After some weeks runnning with this gem, you switch session store to new one.

### Step1. Write session store to both current (cookie) store and new (redis) store

Edit `config/initializers/session_store.rb` like below

```ruby
Rails.application.config.session_store SessionStoreRelocator::CookieToRedis, {
  cookie_store: { key: '_myapp_session' },
  redis_session_store: {
    key: 'myapp_session:',
    redis: {
      url: ENV['SESSION_REDIS_URL'],
      expire_after: 2.weeks,
      key_prefix:  'myapp_session:',
    },
    serializer: :json,
  }
}
```

- `cookie_store` parameter in config option is passwd `ActionDispatch::Session::CookieStore.new`
- `redis_session_store` parameter is passwd onto `RedisSessionStore.new`
  - You may have to customize redis error handling. default is noop, see https://github.com/roidrage/redis-session-store#redis-unavailability-handling

See each documents for detail.

### Step2. Switch to new store

After some days with copying session data, you switch store simply remove this gem.
Then configuration will be like below.

```ruby
Rails.application.config.session_store RedisSessionStore, {
  key: 'myapp_session:',
  redis: {
    url: ENV['SESSION_REDIS_URL'],
    expire_after: 2.weeks,
    key_prefix:  'myapp_session:',
  },
  serializer: :json,
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

