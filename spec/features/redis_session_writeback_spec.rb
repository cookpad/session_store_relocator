require 'spec_helper'

RSpec.feature 'Write back session data to redis', type: :feature do
  let(:redis) { SessionStoreMigratorTestHelper.redis }

  def redis_key(id)
    "dummy_session:#{id}"
  end

  def current_cookie_session_id
    page.driver.browser.rack_mock_session.cookie_jar['_session_id']
  end

  before do
    visit new_message_path(message: 'ohayo-')
    @dumped_session = JSON.parse(page.source)
  end

  scenario 'Add session key to cookie' do
    expect(current_cookie_session_id).to eq @dumped_session['session_id']
  end

  scenario 'Should store session data in redis' do
    expect(@dumped_session['hello_message']).to eq 'ohayo-'

    expect(redis.get(redis_key(@dumped_session['session_id']))).not_to be_nil
  end

  scenario 'Show stored message in cookie session' do
    visit message_path

    response = JSON.parse(page.source)
    expect(response['hello_message']).to eq 'ohayo-'
  end

  scenario 'Destroy session' do
    old_session = @dumped_session

    visit logout_path
    expect(redis.get(redis_key(old_session['session_id']))).to be_nil

    expect(current_cookie_session_id).to eq JSON.parse(page.source)['session_id']
    expect(redis.get(redis_key(current_cookie_session_id))).not_to be_nil
  end
end
