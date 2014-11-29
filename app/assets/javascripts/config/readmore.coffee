$(document).on 'ready page:load', ->
  readmore = $('.readmore')
  readmore.find('.toggle').on 'click', ->
    readmore.find('.toggleable').toggle(200)
