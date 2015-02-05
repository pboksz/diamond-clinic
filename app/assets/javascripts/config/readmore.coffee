$(document).on 'ready page:load', ->
  $('.readmore').each (index, element) ->
    $(element).find('.toggle').on 'click', ->
      $(element).find('.toggleable').toggle(200)
