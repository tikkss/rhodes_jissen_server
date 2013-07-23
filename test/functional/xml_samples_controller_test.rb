require 'test_helper'

class XmlSamplesControllerTest < ActionController::TestCase
  setup do
    @xml_sample = xml_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xml_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xml_sample" do
    assert_difference('XmlSample.count') do
      post :create, xml_sample: { content: @xml_sample.content, title: @xml_sample.title }
    end

    assert_redirected_to xml_sample_path(assigns(:xml_sample))
  end

  test "should show xml_sample" do
    get :show, id: @xml_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xml_sample
    assert_response :success
  end

  test "should update xml_sample" do
    put :update, id: @xml_sample, xml_sample: { content: @xml_sample.content, title: @xml_sample.title }
    assert_redirected_to xml_sample_path(assigns(:xml_sample))
  end

  test "should destroy xml_sample" do
    assert_difference('XmlSample.count', -1) do
      delete :destroy, id: @xml_sample
    end

    assert_redirected_to xml_samples_path
  end
end
