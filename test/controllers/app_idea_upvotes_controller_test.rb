require 'test_helper'

class AppIdeaUpvotesControllerTest < ActionController::TestCase
  setup do
    @app_idea_upvote = app_idea_upvotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_idea_upvotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_idea_upvote" do
    assert_difference('AppIdeaUpvote.count') do
      post :create, app_idea_upvote: {  }
    end

    assert_redirected_to app_idea_upvote_path(assigns(:app_idea_upvote))
  end

  test "should show app_idea_upvote" do
    get :show, id: @app_idea_upvote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_idea_upvote
    assert_response :success
  end

  test "should update app_idea_upvote" do
    patch :update, id: @app_idea_upvote, app_idea_upvote: {  }
    assert_redirected_to app_idea_upvote_path(assigns(:app_idea_upvote))
  end

  test "should destroy app_idea_upvote" do
    assert_difference('AppIdeaUpvote.count', -1) do
      delete :destroy, id: @app_idea_upvote
    end

    assert_redirected_to app_idea_upvotes_path
  end
end
