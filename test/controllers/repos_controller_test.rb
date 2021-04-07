require 'test_helper'

class ReposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repo = repos(:one)
  end

  test "should get index" do
    get repos_url, as: :json
    assert_response :success
  end

  test "should create repo" do
    assert_difference('Repo.count') do
      post repos_url, params: { repo: { link: @repo.link, name: @repo.name } }, as: :json
    end

    assert_response 201
  end

  test "should show repo" do
    get repo_url(@repo), as: :json
    assert_response :success
  end

  test "should update repo" do
    patch repo_url(@repo), params: { repo: { link: @repo.link, name: @repo.name } }, as: :json
    assert_response 200
  end

  test "should destroy repo" do
    assert_difference('Repo.count', -1) do
      delete repo_url(@repo), as: :json
    end

    assert_response 204
  end
end
