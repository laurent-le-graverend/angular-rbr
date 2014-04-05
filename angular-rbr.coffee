'use strict'

angular.module('evasionTarotApp').directive "rbr", ->
  restrict: "A"
  link: (scope, element, attrs) ->
    # <rbr class="x-small small medium large x-large" data-ranges="[320-380, 1024-1082]">

    break_xs = 480
    break_sm = 768
    break_md = 992
    break_lg = 1200
    break_xl = 1300

    _breaks = [
      [break_xs, " x-small xs rbr-xsmall rbr-xs "]
      [break_sm," small sm rbr-small rbr-sm "]
      [break_md, " medium md rbr-medium rbr-md "]
      [break_lg, " large lg rbr-large rbr-lg "]
      [break_xl, " x-large xl rbr-x-large rbr-xl "]
    ]

    _ranges = []
    if $(element).attr('data-ranges')
      _ranges = $(element).attr('data-ranges').replace(RegExp(" ", "g"), "").split ","

    addLineBreak = ->
      return

    removeLineBreak = ->
      return

    resize = () ->
      removeLineBreak()
      width = $(window).width()

      _breaks.forEeach (b) ->
        if width <= b[0]
          addLineBreak() if b[1].test(element.className)

      _ranges.forEach (r) ->
        addLineBreak() if width >= r[0] and width <= r[1]

      return

    $(window).resize ->
      resize()

