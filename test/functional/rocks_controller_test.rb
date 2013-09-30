require 'test_helper'

class RocksControllerTest < ActionController::TestCase
  setup do
    @rock = rocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rock" do
    assert_difference('Rock.count') do
      post :create, rock: { collection_id: @rock.collection_id, name: @rock.name }
    end

    assert_redirected_to rock_path(assigns(:rock))
  end

  test "should show rock" do
    get :show, id: @rock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rock
    assert_response :success
  end

  test "should update rock" do
    put :update, id: @rock, rock: { collection_id: @rock.collection_id, name: @rock.name }
    assert_redirected_to rock_path(assigns(:rock))
  end

  test "should destroy rock" do
    assert_difference('Rock.count', -1) do
      delete :destroy, id: @rock
    end

    assert_redirected_to rocks_path
  end
end
