require './jquery'
module.exports = $ = global['jQuery']

$['textNode'] = (text) ->
  document.createTextNode text
