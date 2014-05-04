json.array! @locations do |location|
  json.extract! location, :id, :name, :weekdays, :weekends, :description
  json.open location.open?
end
