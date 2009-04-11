require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should replace view file" do
    get :index
    assert_response :success
    assert_select 'p', 'Hello from default theme'
  end
  
  test "should replace layout" do
    get :index
    assert_response :success
    assert_select 'div', 'Hello from default theme layout'
  end
end
