'use strict'

angular.module('llg.rbr').directive "rbr", ->
  restrict: "A"
  link: (scope, element, attrs) ->
    # <rbr class="x-small small medium large x-large" data-ranges="[320-380, 1024-1082]">
    
    br = document.createElement "br"

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
    if element.dataset.ranges
      _ranges = element.dataset.ranges.replace(RegExp(" ", "g"), "").split ","

    addLineBreak = ->
      element.appendChild br

    removeLineBreak = ->
      if element.hasChildNodes()
        element.removeChild br

    resize = () ->
      removeLineBreak()
      viewport = document.documentElement.clientWidth

      # allows to leave the loop asap
      needBR = _breaks.some (b) ->
        if viewport <= b[0]
          return b[1].test(element.className)
        return false

      # no need to go more far, we can leave
      return addLineBreak() if needBR is true

      needBR = _ranges.some (r) ->
        values = r.split '-'
        return viewport >= values[0] and viewport <= values[1]

      # no need to go more far, we can leave
      return addLineBreak() if needBR is true

      return false

    window.addEventListener "resize", (event) ->
      resize()

