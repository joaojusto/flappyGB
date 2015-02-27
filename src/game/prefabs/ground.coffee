class Ground extends Phaser.TileSprite
  'use strict'

  contructor: (game, x, y, width, height) ->
    Phaser.TileSprite.call this, game, x, y, width, height, 'ground'
    @autoScroll -200, 0

    @game.physics.arcade.enableBody @

    @body.immovable = true
    @body.allowGravity = false

  updat: ->

module.exports = Ground
