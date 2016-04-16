# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  window.initMap = ->
    $map = $('#RouteMap')
    dest_pos = { lat: $map.data('latitude'), lng: $map.data('longitude') }
    
    gm_map = new google.maps.Map($map.get(0))

    gm_directions_display = new google.maps.DirectionsRenderer();
    gm_directions_display.setMap(gm_map);

    gm_directions_service = new google.maps.DirectionsService();

    new google.maps.Marker({
      position: dest_pos,
      map: gm_map,
      title: $map.data('title')
    });

    if navigator.geolocation 
      navigator.geolocation.getCurrentPosition(
        (position) ->
          gm_directions_request = {
            origin: { lat: position.coords.latitude, lng: position.coords.longitude },
            destination: dest_pos,
            travelMode: google.maps.TravelMode.DRIVING,
            avoidHighways: true,
            avoidTolls: true
          }

          gm_directions_service.route(gm_directions_request, (result, status) ->
            if status == google.maps.DirectionsStatus.OK
              gm_directions_display.setDirections(result);
            else
              console.log('ルートを取得できませんでした。')
              gm_map.setOptions(
                center: dest_pos,
                zoom: 12
              )
          )
        ,
        (error) ->
          console.log(error)
      )
    else
      console.log('Geolocation API を利用できません。')

