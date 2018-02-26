require 'test_helper'

class InstructionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instructions_index_url
    assert_response :success
  end

end
