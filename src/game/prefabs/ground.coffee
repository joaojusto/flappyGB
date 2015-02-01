'use strict'

Ground = (game, x, y, width, height) ->
  Phaser.TileSprite.call this, game, x, y, width, height, 'ground'
  @autoScroll -200, 0

  @game.physics.arcade.enableBody @

  @body.immovable = true
  @body.allowGravity = false

Ground.prototype = Object.create(Phaser.TileSprite.prototype)
Ground::constructor = Ground

Ground::update = ->

module.exports = Ground
