# This file should contain all the record creation needed to seed the database
# with its default values.  The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'time'
require File.dirname(__FILE__) + '/../config/environment.rb'

# Set the time zone for Chronic
Chronic.time_class = Time.zone

# Parses a String with Chronic and returns a Time representation of it
#
# ==== Attributes
# * +time_string+ - The String to parse (any valid Chronic String).
def parse_time_range(time_string)
  return nil if time_string.nil?

  start_time =
    Chronic.parse(time_string.split('-').first.strip).seconds_since_midnight
  end_time =
    Chronic.parse(time_string.split('-').last.strip).seconds_since_midnight

  start_time...end_time
end

def parse_hours(hours)
  return nil if hours.nil?

  hours.split(',').map { |time| parse_time_range time }
end

def parse_hours_for(location)
  location.merge(
    'weekdays' => parse_hours(location['weekdays']),
    'weekends' => parse_hours(location['weekends'])
  )
end

# Create a Location object for each location from the data file
YAML.load_file(Rails.root.join 'db/locations.yml').each do |location|
  Location.create! parse_hours_for location
end
