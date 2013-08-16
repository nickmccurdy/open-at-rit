require 'test_helper'

class LocationsHelperTest < ActionView::TestCase
  setup do
    @corner_store = locations :corner_store
    # Force Rails to save the object so we can test with our callbacks
    @corner_store.save!
  end

  test 'should get the number of locations per row' do
    assert_equal 4, LocationsHelper::LOCATIONS_PER_ROW
  end

  test 'should get the width of each location' do
    assert_equal 3, LocationsHelper::LOCATION_WIDTH
  end
end
