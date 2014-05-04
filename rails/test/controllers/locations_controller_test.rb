require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @corner_store = locations :corner_store
    # Force Rails to save the object so we can test with our callbacks
    @corner_store.save!
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns :locations
  end
end
