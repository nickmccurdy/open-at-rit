require 'test_helper'

class LocationsHelperTest < ActionView::TestCase
  setup do
    @corner_store = create :location
  end

  test 'should get the number of locations per row' do
    assert_equal 4, LocationsHelper::LOCATIONS_PER_ROW
  end

  test 'should get the width of each location' do
    assert_equal 3, LocationsHelper::LOCATION_WIDTH
  end

  test 'should get a location\'s hours during the week and weekend' do
    assert_equal '8:00 am to 2:00 am', hours_for(@corner_store.weekdays)
    assert_equal '10:30 am to 12:00 am', hours_for(@corner_store.weekends)
    assert_raise(ArgumentError) { hours_for(@corner_store, :something_else) }
  end
end
