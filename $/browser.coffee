require './jquery'
module.exports = $ = global['jQuery']

$['textNode'] = $.textNode = (text) ->
  document.createTextNode text

$['setInterval'] = (fn, interval) -> window.setInterval fn, interval
$['clearInterval'] = (id) -> window.clearInterval id

# taken from http://stackoverflow.com/questions/10867506/dragleave-of-parent-element-fires-when-dragging-over-children-elements
$['fn']['dnd'] = (options) ->
  @['each'] ->
    self = $(this)
    collection = $()
    self.on "dragenter", (event) ->
      self.trigger "dndenter", event  if collection.size() is 0
      collection = collection.add(event.target)
      return

    self.on "dragleave", (event) ->
      #
      #             * Firefox 3.6 fires the dragleave event on the previous element
      #             * before firing dragenter on the next one so we introduce a delay
      #             
      setTimeout (->
        collection = collection.not(event.target)
        self.trigger "dndleave", event  if collection.size() is 0
        return
      ), 1

      return

    self.on 'drop', (event) ->
      collection = $()
      return

    return


$['fn']['addClass'] = (arg) ->
  return unless arg
  if arg.constructor is String
    search = " #{arg} "
    for elem in this when elem.nodeType is 1
      className = ' '
      className += elem.className
      className += ' '
      unless ~className.indexOf(search)
        elem.className = (className + arg).trim()
  this

$['fn']['removeClass'] = (arg) ->
  return unless arg
  if arg.constructor is String
    regex = ///(?:^|\s)#{arg}(?:\s|$)///g
    for elem in this when elem.nodeType is 1
      className = elem.className
      newName = className.replace regex, ' '
      if newName isnt className
        elem.className = newName
  this

$['fn']['extend']
  'onBlurContained': (fn) ->
    $content = this
    content = this[0]

    if content.addEventListener
      content.addEventListener 'blur', ((event) =>
        related = event.relatedTarget ? event.toElement ? event.explicitOriginalTarget
        unless related and $content.contains related
          fn()
        return
      ), true

    else if content.attachEvent
      $content[0].attachEvent 'onfocusout', (event) =>
        related = event.relatedTarget ? event.toElement ? event.explicitOriginalTarget
        unless related and $content.contains related
          fn()
        return

  'scrollParent': ->
    unless (elems = @parents().filter(-> return (/(auto|scroll)/).test($.css(this,"overflow")+$.css(this,"overflow-y")+$.css(this,"overflow-x"))).eq(0))[0]
      elems = $('body')
    elems


