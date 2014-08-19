# Displays all Locations with both their preset and generated data.
class LocationsController < ApplicationController
  # Displays all Locations in the database.
  #
  # GET /
  def index
    @locations = Location.all
  end
end
