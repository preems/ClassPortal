require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "User count test from fixtures data fixtures/user.yml" do
     assert_equal 3, User.count
  end
  test "should not save without data" do
      u = User.new
      assert_not u.save
  end
end
