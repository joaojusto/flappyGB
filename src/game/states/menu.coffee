class Menu
  'use strict'

  @titleTxt = null
  @startTxt = null

  create: ->
    @background = @game.add.sprite 0, 0, 'background'
    @ground = @game.add.tileSprite 0, 400, 335, 112, 'ground'
    @ground.autoScroll -200, 0

    @titleGroup = @game.add.group()
    @title = @game.add.sprite 0, 0, 'title'
    @titleGroup.add @title

    @bird = @game.add.sprite 200, 5, 'bird'
    @titleGroup.add @bird

    @bird.animations.add 'flap'
    @bird.animations.play 'flap', 12, true

    @titleGroup.x = 30
    @titleGroup.y = 100

    @game.add.tween(@titleGroup).to { y: 115 }, 350, Phaser.Easing.Linear.NONE, true, 0, 1000, true

    @startButton = @game.add.button @game.width/2, 300, 'startButton', @startClick, @
    @startButton.anchor.setTo 0.5, 0.5

  update: ->


  startClick: ->
    @game.state.start 'play'

module.exports = Menu
