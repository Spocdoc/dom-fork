$ = require 'cheerio-fork'
{extend} = require 'lodash-fork'

$.fn = $prototype = $('').constructor.prototype
$.fn.extend =(obj) ->
  extend $prototype, obj
  return
