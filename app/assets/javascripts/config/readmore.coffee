$(document).on 'ready page:load', ->
  $('.readmore').readmore
    speed: 200
    maxHeight: 90
    moreLink: "<a href='#'>Czytaj Więcej</a>"
    lessLink: "<a href='#'>Czytaj Mniej</a>"
