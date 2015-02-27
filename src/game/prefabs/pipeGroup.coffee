class PipeGroup extends Phaser.Group
  'use strict'

  constructor: (game, parent) ->
    Phaser.Group.call @, game, parent
    @topPipe = new Pipe @game, 0, 0, 0
    @add @topPipe

    @bottomPipe = new Pipe @game, 0, 440, 1
    @add @bottomPipe

    @hasScored = false

    @setAll 'body.velocity.x', -200

  update: ->
    @checkWorldBounds()

  reset: (x, y) ->
    @topPipe.reset 0, 0
    @bottomPipe.reset 0, 440

    @x = x
    @y = y

    @setAll 'body.velocity.x', -200

    @hasScored = false
    @exists = true

  checkWorldBounds: ->
    unless @topPipe.inWorld
      @exists = false

module.exports = PipeGroup
