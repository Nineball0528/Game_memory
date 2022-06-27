require "test_helper"

class Pablic::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pablic_post_index_url
    assert_response :success
  end

  test "should get show" do
    get pablic_post_show_url
    assert_response :success
  end

  test "should get edit" do
    get pablic_post_edit_url
    assert_response :success
  end

  test "should get new" do
    get pablic_post_new_url
    assert_response :success
  end
end
