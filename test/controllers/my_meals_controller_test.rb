require 'test_helper'

class MyMealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_meals_index_url
    assert_response :success
  end

end
