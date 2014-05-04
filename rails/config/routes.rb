Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # The home page, which is the list of all Locations
  root 'locations#index'

  # The main page of the JSON API, which also lists all Locations
  get '/locations.json' => 'locations#index',
      format: false,
      defaults: { format: 'json' }
end
