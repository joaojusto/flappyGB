class Bird extends Phaser.Sprite
  'use strict'

  contructor: (game, x, y, frame) ->
    Phaser.Sprite.call @, game, x, y, 'bird', frame
    @anchor.setTo 0.5, 0.5

    @animations.add 'flap'
    @animations.play 'flap', 12, true

    @hitSound = @game.add.audio 'groundHit'
    @flapSound = @game.add.audio 'flap'

    @alive = false

    @game.physics.arcade.enableBody @
    @body.allowGravity = false

  update: ->
    if @angle < 90 && @alive
      @angle += 2.5

  flap: ->
    if @alive
      @flapSound.play()
      @body.velocity.y = -400
      @game.add.tween(@).to({ angle: -40 }, 100).start()

module.exports = Bird
