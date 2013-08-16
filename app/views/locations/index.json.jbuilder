json.array! @locations do |location|
  json.extract! location, :id, :name, :hours, :description
  json.open location.open?
end
