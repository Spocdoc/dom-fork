$ = require 'cheerio-fork'
{extend} = require 'lodash-fork'

$prototype = $('').constructor.prototype

$.fn =
  extend: (obj) ->
    extend $prototype, obj
    return
