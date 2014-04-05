(function() {
  'use strict';
  angular.module('evasionTarotApp').directive("rbr", function() {
    return {
      restrict: "A",
      link: function(scope, element, attrs) {
        var addLineBreak, break_lg, break_md, break_sm, break_xl, break_xs, removeLineBreak, resize, _breaks, _ranges;
        break_xs = 480;
        break_sm = 768;
        break_md = 992;
        break_lg = 1200;
        break_xl = 1300;
        _breaks = [[break_xs, " x-small xs rbr-xsmall rbr-xs "], [break_sm, " small sm rbr-small rbr-sm "], [break_md, " medium md rbr-medium rbr-md "], [break_lg, " large lg rbr-large rbr-lg "], [break_xl, " x-large xl rbr-x-large rbr-xl "]];
        _ranges = [];
        if ($(element).attr('data-ranges')) {
          _ranges = $(element).attr('data-ranges').replace(RegExp(" ", "g"), "").split(",");
        }
        addLineBreak = function() {};
        removeLineBreak = function() {};
        resize = function() {
          var width;
          removeLineBreak();
          width = $(window).width();
          _breaks.forEeach(function(b) {
            if (width <= b[0]) {
              if (b[1].test(element.className)) return addLineBreak();
            }
          });
          _ranges.forEach(function(r) {
            if (width >= r[0] && width <= r[1]) return addLineBreak();
          });
        };
        return $(window).resize(function() {
          return resize();
        });
      }
    };
  });

}).call(this);
