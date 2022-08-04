require 'test_helper'

class MarimosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marimo = marimos(:one)
  end

  test "should get index" do
    get marimos_url
    assert_response :success
  end

  test "should get new" do
    get new_marimo_url
    assert_response :success
  end

  test "should create marimo" do
    assert_difference('Marimo.count') do
      post marimos_url, params: { marimo: { email: @marimo.email, name: @marimo.name } }
    end

    assert_redirected_to marimo_url(Marimo.last)
  end

  test "should show marimo" do
    get marimo_url(@marimo)
    assert_response :success
  end

  test "should get edit" do
    get edit_marimo_url(@marimo)
    assert_response :success
  end

  test "should update marimo" do
    patch marimo_url(@marimo), params: { marimo: { email: @marimo.email, name: @marimo.name } }
    assert_redirected_to marimo_url(@marimo)
  end

  test "should destroy marimo" do
    assert_difference('Marimo.count', -1) do
      delete marimo_url(@marimo)
    end

    assert_redirected_to marimos_url
  end
end
