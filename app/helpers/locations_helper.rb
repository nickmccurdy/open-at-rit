# Provides helper methods for the application's models, views, and controllers.
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

  # Returns a corrected version of a time Range that ensures that the close
  # time is after the open time. If a Range needs to be corrected, a copy of it
  # with the end advanced a day is returned. Otherwise, the unmodified Range is
  # returned.
  #
  # @param [Range] time_range a Range of Integers to correct
  #
  # @return [Range] a corrected copy of the Range, or the original Range if it
  #   does not need to be corrected
  #
  # TODO: refactor
  def correct_time_range(time_range)
    if time_range.begin < time_range.end
      time_range
    else
      new_end = time_range.end + 1.day
      time_range.begin...new_end
    end
  end

  # Generates a text display of part of a location's hours.
  #
  # @param [Array<Range<Integer>>] hours part of the hours for a location,
  #   representing an certain part of the week (weekdays or weekends).
  #   "Location.weekdays" and "Locations.weekends" will each give you a valid
  #   value to use for this parameter, which should be an Array of Ranges of
  #   Integers (as further explained in the documentation for Location).
  #
  # @return [String] the generated text of the hours during the appropriate
  #   part of the week, in the format "START to END, START to END, ..."
  #
  # TODO: refactor
  def hours_for(hours)
    return 'closed' unless hours.present?

    hours.reduce '' do |memo, time_range|
      start_time = Time.current.midnight.since(time_range.begin)
                       .strftime(TIME_FORMAT).strip
      end_time   = Time.current.midnight.since(time_range.end)
                       .strftime(TIME_FORMAT).strip

      memo + "#{memo.empty? ? '' : ', '}#{start_time} to #{end_time}"
    end
  end

  # Returns true if the given Time is on a weekday (Monday-Friday).
  #
  # @param [Time] time the Time to test (only its date matters)
  #
  # @return [Boolean] true if the Time is on a weekday
  def weekday?(time)
    (1..5).include? time.wday
  end
end
