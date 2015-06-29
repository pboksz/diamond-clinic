$(document).on 'ready page:load', ->
  $('.cookies .close').on 'click', ->
    $('.cookies').slideUp()
    $.cookie('cookies_consent', true, { expires: 120 })
