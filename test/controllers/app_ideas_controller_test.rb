require 'test_helper'

class AppIdeasControllerTest < ActionController::TestCase
  setup do
    @app_idea = app_ideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_idea" do
    assert_difference('AppIdea.count') do
      post :create, app_idea: { tweet: @app_idea.tweet }
    end

    assert_redirected_to app_idea_path(assigns(:app_idea))
  end

  test "should show app_idea" do
    get :show, id: @app_idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_idea
    assert_response :success
  end

  test "should update app_idea" do
    patch :update, id: @app_idea, app_idea: { tweet: @app_idea.tweet }
    assert_redirected_to app_idea_path(assigns(:app_idea))
  end

  test "should destroy app_idea" do
    assert_difference('AppIdea.count', -1) do
      delete :destroy, id: @app_idea
    end

    assert_redirected_to app_ideas_path
  end
end
