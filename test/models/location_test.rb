require 'test_helper'
require 'chronic'

class LocationTest < ActiveSupport::TestCase
  setup do
    @corner_store = locations :corner_store
    # Force Rails to save the object so we can test with our callbacks
    @corner_store.save!
  end

  # test 'should be sorted by name'

  # test 'should validate its name'

  test 'should know if it is open at a certain time' do
    assert_open   @corner_store, '8 am on Monday'
    assert_open   @corner_store, '12 pm on Monday'
    assert_open   @corner_store, '12 am on Tuesday'
    assert_closed @corner_store, '2 am on Tuesday'

    assert_open   @corner_store, '10:30 am on Saturday'
    assert_open   @corner_store, '12 pm on Saturday'
    assert_open   @corner_store, '12 am on Sunday'
    assert_closed @corner_store, '2 am on Sunday'
  end

  test 'should know if a certain time is a weekday' do
    %w[Monday Tuesday Wednesday Thursday Friday].each do |day|
      assert_weekday day
    end

    %w[Saturday Sunday].each { |day| assert_not_weekday day }
  end

  test 'should be initialized properly' do
    assert_equal 'The Corner Store',                  @corner_store.name
    assert_equal [(8.hour.to_i)...(26.hour.to_i)],    @corner_store.weekdays
    assert_equal [(10.5.hour.to_i)...(26.hour.to_i)], @corner_store.weekends
    assert_nil @corner_store.description
  end
end
