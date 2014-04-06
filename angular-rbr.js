(function() {
  'use strict';
  var app;

  app = angular.module('llg.rbr', []);

  app.directive("rbr", function() {
    return {
      restrict: "A",
      link: function(scope, element, attrs) {
        var addLineBreak, break_lg, break_md, break_sm, break_xl, break_xs, break_xxl, break_xxs, e, regexCutClasses, removeLineBreak, resize, _breaks, _ranges;
        break_xxs = 320;
        break_xs = 480;
        break_sm = 768;
        break_md = 992;
        break_lg = 1200;
        break_xl = 1440;
        break_xxl = 2000;
        _breaks = [[break_xxs, " xx-small | xxs | rbr-xxsmall | rbr-xxs "], [break_xs, " x-small | xs | rbr-xsmall | rbr-xs "], [break_sm, " small | sm | rbr-small | rbr-sm "], [break_md, " medium | md | rbr-medium | rbr-md "], [break_lg, " large | lg | rbr-large | rbr-lg "], [break_xl, " x-large | xl | rbr-x-large | rbr-xl "], [break_xxl, " xx-large | xxl | rbr-xx-large | rbr-xxl "]];
        _ranges = [];
        e = element.context;
        if (e.dataset.ranges) {
          _ranges = element.context.dataset.ranges.replace(RegExp(" ", "g"), "").split(",");
        }
        addLineBreak = function() {
          return element.css('display', 'initial');
        };
        removeLineBreak = function() {
          return element.css('display', 'none');
        };
        regexCutClasses = new RegExp(" ", "g");
        resize = function() {
          var arrayClasses, needBR, viewport;
          removeLineBreak();
          viewport = document.documentElement.clientWidth;
          arrayClasses = e.className.replace(regexCutClasses, "|").split('|');
          needBR = arrayClasses.some(function(c) {
            var prevBreak;
            prevBreak = 0;
            return _breaks.some(function(b) {
              var matcher;
              if (viewport <= b[0] && viewport >= prevBreak) {
                matcher = new RegExp(b[1], "g");
                prevBreak = b[0];
                return matcher.test(" " + c + " ");
              }
              prevBreak = b[0];
              return false;
            });
          });
          if (needBR === true) return addLineBreak();
          needBR = _ranges.some(function(r) {
            var values;
            values = r.split('-');
            return viewport >= values[0] && viewport <= values[1];
          });
          if (needBR === true) return addLineBreak();
          return false;
        };
        window.addEventListener("resize", function(event) {
          return resize();
        });
        return resize();
      }
    };
  });

}).call(this);
