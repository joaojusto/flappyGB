class Pipe extends Phaser.Sprite
  'use strict'

  constructor: (game, x, y, frame) ->
    Phaser.Sprite.call @, game, x, y, 'pipe', frame
    @anchor.setTo 0.5, 0.5
    @game.physics.arcade.enableBody @

    @body.immovable = true
    @body.allowGravity = false

module.exports = Pipe
