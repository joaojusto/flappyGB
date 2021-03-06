'use strict'

Bird = (game, x, y, frame) ->
  Phaser.Sprite.call @, game, x, y, 'poop', frame
  @anchor.setTo 0.5, 0.5

  @animations.add 'flap'
  @animations.play 'flap', 12, true

  @hitSound = @game.add.audio 'groundHit'
  @flapSound = @game.add.audio 'flap'

  @alive = false

  @game.physics.arcade.enableBody @
  @body.allowGravity = false

Bird.prototype = Object.create(Phaser.Sprite.prototype)

Bird::constructor = Bird

Bird::update = ->
  if @angle < 90 && @alive
    @angle += 2.5

  if @body.position.y < 0
    @body.position.y = 0

Bird::flap = ->
  if @alive
    @flapSound.play()
    @body.velocity.y = -400
    @game.add.tween(@).to({ angle: -40 }, 100).start()

module.exports = Bird
