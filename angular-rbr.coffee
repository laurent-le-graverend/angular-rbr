##
 # angular-rbb
 # (c) 2014 Laurent Le Graverend http://www.legraverend.fr
 # License: MIT
 ##

'use strict'

app = angular.module('llg.rbr', [])

app.directive "rbr", ->
  restrict: "A"
  link: (scope, element, attrs) ->
    # <br rbr class="x-small small medium large x-large" data-ranges="320-380, 1024-1082">
    

    # TODO, this is not optimized to have these variables within the directive
    break_xxs = 320
    break_xs = 480
    break_sm = 768
    break_md = 992
    break_lg = 1200
    break_xl = 1440
    break_xxl = 2000

    _breaks = [
      [break_xxs, " xx-small | xxs | rbr-xxsmall | rbr-xxs "]
      [break_xs,  " x-small | xs | rbr-xsmall | rbr-xs "]
      [break_sm,  " small | sm | rbr-small | rbr-sm "]
      [break_md,  " medium | md | rbr-medium | rbr-md "]
      [break_lg,  " large | lg | rbr-large | rbr-lg "]
      [break_xl,  " x-large | xl | rbr-x-large | rbr-xl "]
      [break_xxl, " xx-large | xxl | rbr-xx-large | rbr-xxl "]
    ]

    _ranges = []
    e = element.context
    
    if e.dataset.ranges
      _ranges = element.context.dataset.ranges.replace(RegExp(" ", "g"), "").split ","

    addLineBreak = ->
      element.css 'display', 'initial'

    removeLineBreak = ->
      element.css 'display', 'none'

    regexCutClasses = new RegExp " ", "g"
    resize = () ->
      removeLineBreak()
      viewport = document.documentElement.clientWidth

      # allows to leave the loop asap
      arrayClasses = e.className.replace(regexCutClasses, "|").split '|'
      needBR = arrayClasses.some (c) ->
        prevBreak = 0
        return _breaks.some (b) ->
          if viewport <= b[0] and viewport >= prevBreak
            matcher = new RegExp b[1], "g"
            prevBreak = b[0]
            return matcher.test " " + c + " "
          prevBreak = b[0]
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

    return resize()
