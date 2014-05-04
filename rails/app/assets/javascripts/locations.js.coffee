# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# TODO set up jslint and maybe a doc tool for this file

# A collection of helper methods that act on all Locations being displayed.
Locations =

  # Updates various styling properties within the UI. Designed to be called on
  # page load and on window resize.
  updateUI: ->
    Locations.syncHeights()
    Locations.verticalPull()

  # Syncs the heights of all the divs that represent Locations. Every Location
  # should have the same height as the tallest Location in its row.
  syncHeights: ->
    # TODO remove this log message when it is no longer needed
    console.log 'syncing heights...'

    $('.location-row').each ->
      $('.location', this).css 'height', Locations.getMaxHeight this

  # Vertically centers any elements of the pull-middle class within their parent
  # elements.
  verticalPull: ->
    $('.pull-middle').each ->
      offset = ($(this).parent.height() - $(this).height()) / 2
      $(this).css 'margin-top', offset

  # Gets the maximum height of all Locations being displayed.
  getMaxHeight: (context) ->
    heights = $('.location', context).map(-> $(this).height()).get()
    Math.max.apply null, heights

# When the document is done loading or the window is resized, update the UI.
$ ->
  Locations.updateUI()
  $(window).resize Locations.updateUI()
