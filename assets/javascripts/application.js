// 3rd-party libraries

//= require 'jquery'
//= require 'highcharts'
//= require 'highlightjs'
//= require 'angular'
//= require 'angular-resource'
//= require 'highcharts-ng'
//= require 'angular-highlightjs'
//= require 'smallworld.js/dist/smallworld.js'

// Application code

//= require 'smallworld_data'
//= require 'client'
//= require './client/loans_controller'
//= require './client/available_balance_controller'
//= require './client/amount_lent_controller'
//= require './client/money_available_controller'

//= require './client/querier'

naughtyGlobalMaps = [];

function collectionHas(haystack, needle) {
    for(var i = 0, len = haystack.length; i < len; i ++) {
      if(haystack[i] == needle) return true;
    }
    return false;
}


function findParentBySelector(elm, selector) {
  var all = document.querySelectorAll(selector);
  var current = elm.parentNode;
  while(current&& !collectionHas(all, current)) {
    current = current.parentNode;
  }
  return current;
}


/* FIXME: Don't want to rely on jQuery for this kind of stuff
 *        Rewrite to use vanilla JS pls, Andy
 */

$(document).ready(function () {
  $('.accordion-tabs').each(function(index) {
    $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show();
  });
  $('.accordion-tabs').on('click', 'li > a.tab-link', function(event) {
    if (!$(this).hasClass('is-active')) {
      event.preventDefault();
      var accordionTabs = $(this).closest('.accordion-tabs');
      accordionTabs.find('.is-open').removeClass('is-open').hide();

      $(this).next().toggleClass('is-open').toggle();
      accordionTabs.find('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
    } else {
      event.preventDefault();
    }
  });
});




document.addEventListener('DOMContentLoaded', function(e) {
  var extractCoordinatesFromLoan = function(loanEl) {
    var coordinates = loanEl.getAttribute('data-map-location');
    if(coordinates) {
      var coordinatePairs = coordinates.split(', ');
      return [parseFloat(coordinatePairs[0]), parseFloat(coordinatePairs[1])];
    } else {
      return [0,0];
    }
  }

  var maps = document.querySelectorAll('.map');

  for(var i = 0; i < maps.length; i++) {
    var map  = maps[i],
        loan = findParentBySelector(map, '.loan'),
        coordinates;

    if(loan) {
      coordinates = extractCoordinatesFromLoan(loan);
      var m = new Smallworld(map, {
        center: [45, 0],
        marker: coordinates
      });
      naughtyGlobalMaps.unshift(m);
    }
  }
});
