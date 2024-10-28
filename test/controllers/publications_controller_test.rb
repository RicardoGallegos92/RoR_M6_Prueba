require "test_helper"

class PublicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publications_index_url
    assert_response :success
  end

  test "should get show" do
    get publications_show_url
    assert_response :success
  end

  test "should get update" do
    get publications_update_url
    assert_response :success
  end

  test "should get create" do
    get publications_create_url
    assert_response :success
  end
end
