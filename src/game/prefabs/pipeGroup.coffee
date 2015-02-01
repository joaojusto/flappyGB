'use strict'

Pipe = require './pipe'

PipeGroup = (game, parent) ->
  Phaser.Group.call @, game, parent
  @topPipe = new Pipe @game, 0, 0, 0
  @add @topPipe

  @bottomPipe = new Pipe @game, 0, 440, 1
  @add @bottomPipe

  @hasScored = false

  @setAll 'body.velocity.x', -200

PipeGroup.prototype = Object.create(Phaser.Group.prototype)

PipeGroup::constructor = PipeGroup

PipeGroup::update = ->
  @checkWorldBounds()

PipeGroup::reset = (x, y) ->
  @topPipe.reset 0, 0
  @bottomPipe.reset 0, 440

  @x = x
  @y = y

  @setAll 'body.velocity.x', -200

  @hasScored = false
  @exists = true

PipeGroup::checkWorldBounds = ->
  unless @topPipe.inWorld
    @exists = false

module.exports = PipeGroup
