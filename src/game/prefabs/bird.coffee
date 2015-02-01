# class Bird extends Phaser.Sprite.prototype
#   'use strict'
#
#   constructor: (game, x, y, frame) ->
#     debugger
#     Phaser.Sprite.call @, game, x, y, 'bird', frame
#     @anchor.setTo 0.5, 0.5
#
#     @animations.add 'flap'
#     @animations.play 'flap', 12, true
#
#     @game.physics.arcade.enableBody @
#
#   update: ->
#
# module.exports = Bird

'use strict'

Bird = (game, x, y, frame) ->
  Phaser.Sprite.call @, game, x, y, 'bird', frame
  @anchor.setTo 0.5, 0.5

  @animations.add 'flap'
  @animations.play 'flap', 12, true

  @game.physics.arcade.enableBody @

Bird.prototype = Object.create(Phaser.Sprite.prototype)
Bird::constructor = Bird

Bird::update = ->

module.exports = Bird
