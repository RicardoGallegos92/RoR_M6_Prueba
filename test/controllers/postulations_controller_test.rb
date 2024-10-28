require "test_helper"

class PostulationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postulations_index_url
    assert_response :success
  end

  test "should get show" do
    get postulations_show_url
    assert_response :success
  end

  test "should get create" do
    get postulations_create_url
    assert_response :success
  end
end
