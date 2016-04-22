# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $('body').data('controller_name') == 'destinations' && $('body').data('action_name') == 'show'
    $map = $('#RouteMap')

    dest_pos = { lat: $map.data('latitude'), lng: $map.data('longitude') }
    
    gm_map = new google.maps.Map($map.get(0))
    gm_geocoder = new google.maps.Geocoder()

    gm_directions_display = new google.maps.DirectionsRenderer()
    gm_directions_display.setMap(gm_map);

    gm_directions_service = new google.maps.DirectionsService()

    new google.maps.Marker({
      position: dest_pos,
      map: gm_map,
      title: $map.data('title')
    })

    setDirection = (dept_pos) ->
      gm_directions_request = {
        origin: dept_pos,
        destination: dest_pos,
        travelMode: google.maps.TravelMode.DRIVING,
        avoidHighways: true,
        avoidTolls: true
      }

      gm_directions_service.route(gm_directions_request, (result, status) ->
        # console.log(result)
        if status == google.maps.DirectionsStatus.OK
          gm_directions_display.setDirections(result)

          distance = result.routes[0].legs[0].distance.text
          $('div.distance span.distance').text(distance)
        else
          console.log('ルートを取得できませんでした。')
          gm_map.setOptions(
            center: dest_pos,
            zoom: 12
          )
          $('div.distance span.distance').text("取得に失敗しました")
      )

    if gon.current_location
      console.log(gon.current_location)
      setDirection(gon.current_location)
    else
      if navigator.geolocation 
        navigator.geolocation.getCurrentPosition(
          (position) ->
            setDirection({ lat: position.coords.latitude, lng: position.coords.longitude })
          ,
          (error) ->
            console.log(error)
        )
      else
        console.log('Geolocation API を利用できません。')

    # スポットを「地図上に表示」
    $('span.display_in_map').on('click', ->
      $anchor = $(@)

      unless $anchor.hasClass('done')
        add_marker = (location) ->
          marker = new google.maps.Marker({
            position: location,
            map: gm_map,
            label: $anchor.data('name')[0..1],
          })

          info_window = new google.maps.InfoWindow({
            content: $anchor.data('name'),
          })
          
          google.maps.event.addListener(marker, 'click', ->
            info_window.open(gm_map, marker)
          )

          $anchor.addClass('done')

        if $(@).data('latitude') && $(@).data('longitude')
          add_marker({ lat: $(@).data('latitude'), lng: $(@).data('longitude') })
        else
          gm_geocoder.geocode({ address: $(@).data('name') }, (results, status) ->
            console.log(results)
            location = results[0].geometry.location
            add_marker(location)
          )
    )
