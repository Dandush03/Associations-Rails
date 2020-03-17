require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get singup_path
    assert_response :success
  end
end
