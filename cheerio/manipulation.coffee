$ = require 'cheerio-fork'
{extend} = require 'lodash-fork'

$prototype = $('').constructor.prototype

extend $prototype,

  scrollLeft: -> this
  scrollTop: -> this

  name: ->
    @[0].name.toLowerCase()

  parents: ->
    e = this
    e = e.parent() while e[0].parent && e[0].parent.type isnt 'root'

  appendTo: ($rhs) -> $rhs.append this
  prependTo: ($rhs) -> $rhs.prepend this

  detach: $prototype.remove

  toggleClass: (name, value) ->
    if @hasClass name
      @removeClass name unless value
    else
      @addClass name if value
    return

  childNumber: ->
    i = 0
    node = @[0]
    ++i while node = node.prev
    i

  css: (prop, value) ->
    if undefined isnt style = @attr 'style'
      existing = style.split(/;\s*/)
    else
      existing = []

    found = existing.length

    for name,i in existing
      if name.substr(0,name.indexOf(':')) is prop
        found = i
        break

    existing[found] = "#{prop}: #{value}"
    @attr 'style', existing.join("; ")

  contents: ->
    nodes = []
    nodes.push element.children... for element in this
    @make nodes

  contains: (arg) ->
    return true if arg is node = @[0]
    while arg = arg.parent when node is arg
      return true
    false






