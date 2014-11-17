$(document).on 'ready page:load', ->
  match = window.location.pathname.match(/\/(en|pl)\//i)
  locale = if match then match[1] else 'en'

  $.datepicker.setDefaults($.datepicker.regional[locale]);
  $('.datepicker').datepicker
    dateFormat: 'dd.mm.yy'
    firstDay: 1
    minDate: '+1d'
    numberOfMonths: 2
    beforeShowDay: (date) ->
      [date.getDay() != 0, '']
