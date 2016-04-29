# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $('body').data('controller_name') == 'current_locations' && $('body').data('action_name') == 'new'
    gm_geocoder = new google.maps.Geocoder()

    $input = $('#current_location')

    $input.on('change', ->
      gm_geocoder.geocode({ address: $input.val() }, (results, status) ->
        if status == 'OK'
          # console.log(results[0])
          $('span.suggested_address').text(results[0].formatted_address)
          $('#suggested_address').val(results[0].formatted_address)
          $('p.suggested_address').show()
          $('input[type=submit]').removeAttr('disabled')
        )
    )

    timer = null

    $input.on('focus', ->
      window.clearInterval(timer)
      prev_val = ""
      timer = window.setInterval( ->
        new_val = $input.val()
        if prev_val != new_val
          $input.trigger('change')
        prev_val = new_val
      , 1000)
    )

    $input.on('blur', ->
      window.clearInterval(timer)
    )
