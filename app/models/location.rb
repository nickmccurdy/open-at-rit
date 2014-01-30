# A Location at RIT. Every Location has a name, two lists of hours (one for
# during the week, another for during the weekend), and an optional description
# (displayed in a tooltip in the view, if there is one). Location data should
# not frequently change at runtime, because the appropriate data is created in
# a database seed. If a location is always closed during weekdays and/or
# weekends, the appropriate times will be set to nil.
class Location < ActiveRecord::Base
  # The weekdays/weekends property is a serialized String representing an Array
  # of Ranges of Integers. The Array represents all the hours for a given part
  # of the week. Each Range represents one part of the hours (open and close
  # time). Each Integer represents the number of seconds after midnight that
  # the Location opens or closes.
  # TODO: Update this description for the new hours property
  serialize :hours, Array

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

  # Returns true if the given Time is on a weekday (Monday-Friday).
  #
  # @param [Time] time the Time to test (only its date matters)
  #
  # @return [Boolean] true if the Time is on a weekday
  def self.weekday?(time)
    (1..5).include? time.wday
  end

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
    part_of_week = Location.weekday?(time) ? hours[0] : hours[1]
    return false if part_of_week.blank?

    # TODO: fix this log message
    # logger.debug "Checking to see if #{time} is between " \
    #              "#{start_time} and #{end_time}."

    # TODO: find a better way to do this that won't break when moving between
    # weekdays and weekends
    part_of_week.any? do |time_range|
      start_time = time.midnight + time_range.begin
      end_time   = time.midnight + time_range.end
      IceCube::Schedule.new(start_time, end_time: end_time).occurs_at? time
    end
  end

  private

  # A callback that runs before any Location is saved. This adds a day to end
  # times if needed to ensure that the end times are always after their
  # matching start times.
  #
  # TODO: refactor
  def adjust_times
    # Returns a corrected version of a time Range that ensures that the close
    # time is after the open time.
    #
    # TODO: refactor
    adjust = proc do |time_range|
      if time_range.begin < time_range.end
        time_range
      else
        new_end = time_range.end + 1.day
        time_range.begin...new_end
      end
    end

    hours.each do |period|
      period.map!(&adjust) if period.present?
    end
  end
end
