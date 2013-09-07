$ = module.exports = require 'cheerio-fork'

require './cheerio/extend'
require './cheerio/events'
require './cheerio/manipulation'

$.htmlEscape = do ->
  p = $ '<p>'
  (text) -> p.text(text).html()
