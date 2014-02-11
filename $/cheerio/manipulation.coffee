ElementType = require "domelementtype-fork"
$ = require 'cheerio-fork'
{extend} = require 'lodash-fork'

$prototype = $('').constructor.prototype

extend $prototype,

  scrollLeft: ->
    if arguments.length
      this
    else
      0

  scrollTop: ->
    if arguments.length
      this
    else
      0

  height: -> NaN
  width: -> NaN

  parents: ->
    e = this
    e = e.parent() while e[0].parentNode && !(e[0].parentNode.nodeType in [ElementType.Document, ElementType.DocumentFragment])

  appendTo: ($rhs) -> $rhs.append this
  prependTo: ($rhs) -> $rhs.prepend this

  detach: $prototype.remove

  toggleClass: (name, value) ->
    if @hasClass name
      @removeClass name unless value
    else
      @addClass name if value
    return

  childIndex: ->
    i = 0
    node = @[0]
    ++i while node = node.previousSibling
    i

  # css: (prop, value) ->
  #   if undefined isnt style = @attr 'style'
  #     existing = style.split(/;\s*/)
  #   else
  #     existing = []

  #   found = existing.length

  #   for name,i in existing
  #     if name.substr(0,name.indexOf(':')) is prop
  #       found = i
  #       break

  #   existing[found] = "#{prop}: #{value}"
  #   @attr 'style', existing.join("; ")

#   contents: ->
#     nodes = []
#     nodes.push element.children... for element in this
#     @make nodes





