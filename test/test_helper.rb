# require 'simplecov'
# SimpleCov.start 'rails'

require 'zonebie'
Zonebie.set_random_timezone

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
  # order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in
  # integration tests -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  include LocationsHelper

  # Ensures that a location is open at a given time
  def assert_open(location, time_str)
    assert("#{location.name} should be open at #{time_str}") do
      location.open? Chronic.parse time_str
    end
  end

  # Ensures that a location is closed at a given time
  def assert_closed(location, time_str)
    assert("#{location.name} should be closed at #{time_str}") do
      !location.open? Chronic.parse time_str
    end
  end

  # Ensures that a given day of the week is a weekday
  def assert_weekday(day_of_week)
    assert Location.weekday?(Chronic.parse day_of_week),
           "#{day_of_week} should be a weekday"
  end

  # Ensures that a given day of the week is not a weekday
  def assert_not_weekday(day_of_week)
    assert !Location.weekday?(Chronic.parse day_of_week),
           "#{day_of_week} should not be a weekday"
  end
end
