require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get login
    assert_response :success
  end
end
