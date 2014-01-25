# A Location at RIT. Every Location has a name, two lists of hours (one for
# during the week, another for during the weekend), and an optional description
# (displayed in a tooltip in the view, if there is one). Location data should
# not frequently change at runtime, because the appropriate data is created in
# a database seed. If a location is always closed during weekdays and/or
# weekends, the appropriate times will be set to nil.
class Location < ActiveRecord::Base
  include LocationsHelper

  # The weekdays/weekends property is a serialized String representing an Array
  # of Ranges of Integers. The Array represents all the hours for a given part
  # of the week. Each Range represents one part of the hours (open and close
  # time). Each Integer represents the number of seconds after midnight that
  # the Location opens or closes.
  serialize :weekdays, Array
  serialize :weekends, Array

  # Locations are sorted by name in alphabetical order.
  default_scope { order 'name ASC' }

  # Location names are mandatory, and should always be unique.
  #
  # TODO: test validations
  validates :name,
            presence: true,
            uniqueness: true

  # A callback that runs before any Location is saved.
  before_save :adjust_times

  # Returns true if the Location is open at the given Time. This is likely the
  # most important method in the application.
  #
  # @param [Time] time the Time that the user wants to know if the Location is
  #   open during (defaults to the current time if it is not given)
  #
  # @return [Boolean] true if the Location is open at the given Time
  #
  # TODO: refactor
  def open?(time = Time.current)
    # Figure out if the time is between the hours for the appropriate part of
    # the week
    hours = weekday?(time) ? weekdays : weekends
    return false unless hours.present?

    time = time.seconds_since_midnight

    # TODO: fix this log message
    # logger.debug "Checking to see if #{time} is between " \
    #              "#{start_time} and #{end_time}."

    # TODO: find a better way to do this that won't break when moving between
    # weekdays and weekends
    hours.any? do |time_range|
      time_range.cover?(time) || time_range.cover?(time + 1.day)
    end
  end

  private

  # A callback that runs before any Location is saved. This adds a day to end
  # times if needed to ensure that the end times are always after their
  # matching start times.
  #
  # TODO: refactor
  def adjust_times
    if weekdays.present?
      weekdays.map! { |time_range| correct_time_range time_range }
    end
    if weekends.present?
      weekends.map! { |time_range| correct_time_range time_range }
    end
  end
end
