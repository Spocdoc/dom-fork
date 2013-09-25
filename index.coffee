module.exports = $ = require './$'

$['htmlEscape'] = $.htmlEscape = do ->
  p = $ '<p>'
  (text) -> p.text(text).html()

$['getChildIndex'] = $.getChildIndex = (e) ->
  k = 0
  k++ while e = e.previousSibling
  k

$['fn']['extend']
  'name': -> @[0].nodeName

  'childIndex': ->
    e = @[0]
    i = 0
    ++i while e = e.previousSibling
    i

