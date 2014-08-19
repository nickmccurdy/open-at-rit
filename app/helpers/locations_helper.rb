# Provides helper methods for the application's views and controllers.
module LocationsHelper
  # The number of locations to show per row (for screens with enough room).
  LOCATIONS_PER_ROW = 4

  # The relative width of a location (assuming Bootstrap's default grid system
  # with 12 units per row). Note that the width of each location is rounded
  # down if necessary.
  LOCATION_WIDTH = 12 / LOCATIONS_PER_ROW

  # The format string to use for displaying start/end times in views. Used by
  # strftime.
  TIME_FORMAT = '%l:%M %P'

  # Returns a human readable String representing part of a location's hours.
  # This will represent the appropriate part of the week, in the format
  # "START to END, START to END, ...".
  #
  # TODO: refactor
  #
  # ==== Attributes
  # * +hours+ - Part of the hours for a location,
  #   representing an certain part of the week (weekdays or weekends).
  #   "Location.weekdays" and "Locations.weekends" will each give you a valid
  #   value to use for this parameter, which should be an Array of Ranges of
  #   Integers (as further explained in the documentation for Location).
  def hours_for(hours)
    return 'closed' if hours.blank?

    hours.reduce '' do |memo, time_range|
      midnight   = Time.current.midnight
      start_time = midnight.since(time_range.begin).strftime(TIME_FORMAT).strip
      end_time   = midnight.since(time_range.end).strftime(TIME_FORMAT).strip

      memo + "#{memo.empty? ? '' : ', '}#{start_time} to #{end_time}"
    end
  end
end
