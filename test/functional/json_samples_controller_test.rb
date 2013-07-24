require 'test_helper'

class JsonSamplesControllerTest < ActionController::TestCase
  setup do
    @json_sample = json_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:json_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create json_sample" do
    assert_difference('JsonSample.count') do
      post :create, json_sample: { content: @json_sample.content, title: @json_sample.title }
    end

    assert_redirected_to json_sample_path(assigns(:json_sample))
  end

  test "should show json_sample" do
    get :show, id: @json_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @json_sample
    assert_response :success
  end

  test "should update json_sample" do
    put :update, id: @json_sample, json_sample: { content: @json_sample.content, title: @json_sample.title }
    assert_redirected_to json_sample_path(assigns(:json_sample))
  end

  test "should destroy json_sample" do
    assert_difference('JsonSample.count', -1) do
      delete :destroy, id: @json_sample
    end

    assert_redirected_to json_samples_path
  end
end
