# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  window.addListener = ->
    gm_geocoder = new google.maps.Geocoder()

    $input = $('#current_location')

    $input.on('change', ->
      gm_geocoder.geocode({ address: $input.val() }, (results, status) ->
        if status == 'OK'
          console.log(results[0])
          $('span.suggested_address').text(results[0].formatted_address)
          $('#suggested_address').val(results[0].formatted_address)
          $('p.suggested_address').show()
          $('input[type=submit]').removeAttr('disabled')
        )
    )
