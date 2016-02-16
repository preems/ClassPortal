require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "HOME"
  end

  test "should get help" do
    get :help
    assert_response :success

    assert_select "title", "Help"
  end

end
