'use strict'

Bird = (game, x, y, frame) ->
  Phaser.Sprite.call @, game, x, y, 'bird', frame
  @anchor.setTo 0.5, 0.5

  @animations.add 'flap'
  @animations.play 'flap', 12, true

  @alive = false

  @game.physics.arcade.enableBody @
  @body.allowGravity = false

Bird.prototype = Object.create(Phaser.Sprite.prototype)

Bird::constructor = Bird

Bird::update = ->
  if @angle < 90 && @alive
    @angle += 2.5

Bird::flap = ->
  @body.velocity.y = -400
  @game.add.tween(@).to({ angle: -40 }, 100).start()

module.exports = Bird
