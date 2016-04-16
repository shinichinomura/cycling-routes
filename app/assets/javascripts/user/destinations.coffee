# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  window.initMap = ->
    $map = $('#RouteMap')
    pos = { lat: $map.data('latitude'), lng: $map.data('longitude') }
    
    gm_map = new google.maps.Map($map.get(0), {
        center: pos,
        zoom: 12
      }
    )

    new google.maps.Marker({
      position: pos,
      map: gm_map,
      title: $map.data('title')
    });
