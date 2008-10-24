require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_places
    assert_difference('Places.count') do
      post :create, :places => { }
    end

    assert_redirected_to places_path(assigns(:places))
  end

  def test_should_show_places
    get :show, :id => places(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => places(:one).id
    assert_response :success
  end

  def test_should_update_places
    put :update, :id => places(:one).id, :places => { }
    assert_redirected_to places_path(assigns(:places))
  end

  def test_should_destroy_places
    assert_difference('Places.count', -1) do
      delete :destroy, :id => places(:one).id
    end

    assert_redirected_to places_path
  end
end
