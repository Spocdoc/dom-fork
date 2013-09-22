require './jquery'
module.exports = $ = global['jQuery']

ELEMENT_NODE = 1
ATTRIBUTE_NODE = 2
TEXT_NODE = 3
COMMENT_NODE = 8
DOCUMENT_NODE = 9
DOCUMENT_TYPE_NODE = 10
DOCUMENT_FRAGMENT_NODE = 11

$['htmlEscape'] = $.htmlEscape = do ->
  p = $ '<p>'
  (text) -> p.text(text).html()

$['fn']['extend']
  'name': ->
    (''+@[0].nodeName).toLowerCase()

  'childNumber': ->
    e = @[0]
    i = 0
    ++i while e = e.previousSibling
    i

$['isText'] = (d) ->
  d?.nodeType is TEXT_NODE

$['getChildIndex'] = (e) ->
  k = 0
  k++ while e = e.previousSibling
  k

$['isElement'] = (d) ->
  d?.nodeType is ELEMENT_NODE
