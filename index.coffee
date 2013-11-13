ELEMENT_NODE = 1
ATTRIBUTE_NODE = 2
TEXT_NODE = 3
COMMENT_NODE = 8
DOCUMENT_NODE = 9
DOCUMENT_TYPE_NODE = 10
DOCUMENT_FRAGMENT_NODE = 11

module.exports = $ = require './$'

$['htmlEscape'] = $.htmlEscape = do ->
  p = $ '<p>'
  (text) -> p.text(text).html()

$['getChildIndex'] = $.getChildIndex = (e) ->
  k = 0
  k++ while e = e.previousSibling
  k

$['isText'] = (d) ->
  d?.nodeType is TEXT_NODE

$['isElement'] = (d) ->
  d?.nodeType is ELEMENT_NODE

$['fn']['extend']
  'name': -> @[0].nodeName

  'childIndex': ->
    e = @[0]
    i = 0
    ++i while e = e.previousSibling
    i

  'contains': (arg) ->
    return true if arg is node = @[0]
    while arg = arg.parentNode when node is arg
      return true
    false
