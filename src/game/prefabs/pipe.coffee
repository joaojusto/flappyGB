'use strict'

Pipe = (game, x, y, frame) ->
  Phaser.Sprite.call @, game, x, y, 'pipe', frame
  @anchor.setTo 0.5, 0.5
  @game.physics.arcade.enableBody @

  @body.immovable = true
  @body.allowGravity = false

Pipe.prototype = Object.create(Phaser.Sprite.prototype)

Pipe::constructor = Pipe

module.exports = Pipe
