require 'test_helper'

class SessionStoreMigratorTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, SessionStoreRelocator
  end
end
