# Open at RIT
[![Build Status](https://secure.travis-ci.org/nicolasmccurdy/open-at-rit.png?branch=master)](http://travis-ci.org/nicolasmccurdy/open-at-rit)
[![Dependency Status](https://gemnasium.com/nicolasmccurdy/open-at-rit.png)](https://gemnasium.com/nicolasmccurdy/open-at-rit)
[![Code Climate](https://codeclimate.com/github/nicolasmccurdy/open-at-rit.png)](https://codeclimate.com/github/nicolasmccurdy/open-at-rit)
[![Test Coverage](https://codeclimate.com/github/nicolasmccurdy/open-at-rit/badges/coverage.svg)](https://codeclimate.com/github/nicolasmccurdy/open-at-rit)

Open at RIT is a simple one-page web application that makes it easy to check
which dining locations are currently open at the [Rochester Institute of
Technology](https://www.rit.edu).

## Project Status
__In development. Fairly unstable.__


## Definite Features (in development)
- a simple, color-coded display that makes it easy to see what's open
- a responsive design that also works well on smartphones
- information on the hours for different locations
- support for special hours (hours for time periods where students do not often
  take classes, such as breaks and summer quarters/semesters)

## Possible Features
- sorting locations based on name, open/closed status, hours, etc.
- filtering locations based on tags
- support for other kinds of locations (like offices, labs, and stores)
- a scraper that automatically updates the app's database with information from
  RIT's website
- a simple JSON API

## Installation
Before you start, install and use Ruby 2.1. Make sure you have the bundler gem. It will install Rails 4 for you.
```bash
git clone https://github.com/nicolasmccurdy/open-at-rit.git
cd open-at-rit
bundle install
rake db:setup
rails server
```

## Technology Stack
- Ruby 2.1
- Rails 4
- JavaScript
- SASS
- Heroku (for production)

## Updating Hours
This app currently uses the `db/locations.yml` file to store information on
locations and their hours. This data file must be updated manually. `rake
db:seed` will use this file to generate the database of locations from this
file. After that, the database should not need to be modified unless hours
or locations need to be updated.
