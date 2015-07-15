# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  loadTwitterSDK()
  $(document).on 'page:change', renderTimelines

loadTwitterSDK = ->
  $.getScript "//platform.twitter.com/widgets.js", ->
    renderTimelines()

renderTimelines = ->
  $('.twitter-timeline-container').each ->
    $container = $(this)
    widgetId = $container.data 'widget-id'
    widgetOptions = $container.data 'widget-options'
    $container.empty()
    twttr?.widgets.createTimeline widgetId, $container[0], null, widgetOptions