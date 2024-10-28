require "test_helper"

class PublicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publication_index_url
    assert_response :success
  end

  test "should get show" do
    get publication_show_url
    assert_response :success
  end

  test "should get update" do
    get publication_update_url
    assert_response :success
  end

  test "should get create" do
    get publication_create_url
    assert_response :success
  end
end
