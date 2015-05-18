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
