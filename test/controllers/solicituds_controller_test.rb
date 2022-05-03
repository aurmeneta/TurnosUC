require 'test_helper'

class SolicitudsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get solicituds_index_url
    assert_response :success
  end

  test "should get create" do
    get solicituds_create_url
    assert_response :success
  end

  test "should get delete" do
    get solicituds_delete_url
    assert_response :success
  end

  test "should get edit" do
    get solicituds_edit_url
    assert_response :success
  end

  test "should get update" do
    get solicituds_update_url
    assert_response :success
  end

end
