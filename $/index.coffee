$ = module.exports = require 'cheerio-fork'

require './cheerio/extend'
require './cheerio/events'
require './cheerio/manipulation'

$.isText = (d) ->
  d?.nodeType is 'text'

$.isElement = (d) ->
  d?.type is 'tag'
