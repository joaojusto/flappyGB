class Play
  'use strict'

  Bird = require '../prefabs/bird'
  Ground = require '../prefabs/ground.coffee'

  create:  ->
    @game.physics.startSystem(Phaser.Physics.ARCADE)
    @game.physics.arcade.gravity.y = 500

    @background = @game.add.sprite 0, 0, 'background'

    @bird = new Bird @game, 100, @game.height/2
    @game.add.existing @bird

    @ground = new Ground @game, 0, 400, 335, 112
    @game.add.existing @ground

  update: ->
    @game.physics.arcade.collide @bird, @ground

module.exports = Play
