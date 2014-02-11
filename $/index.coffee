$ = module.exports = require 'cheerio-fork'

require './cheerio/extend'
require './cheerio/events'
require './cheerio/manipulation'
require './cheerio/timers'

$.isText = (d) ->
  d?.nodeType is 'text'

$.isElement = (d) ->
  d?.type is 'tag'

$.fn.scrollParent = -> $ null
