class Preloader
  'use strict'

  @asset = null
  @ready = false

  preload: ->
    @load.onLoadComplete.addOnce @onLoadComplete, this
    @asset = @add.sprite @width/2, @height/2, 'preloader'
    @asset.anchor.setTo 0.5, 0.5
    @load.setPreloadSprite @asset

    @load.image 'background', 'assets/images/background.png'
    @load.image 'ground', 'assets/images/ground.png'
    @load.image 'title', 'assets/images/title.png'
    @load.image 'startButton', 'assets/images/start-button.png'
    @load.image 'instructions', 'assets/images/instructions.png'
    @load.image 'getReady', 'assets/images/get-ready.png'

    @load.spritesheet 'bird', 'assets/images/bird.png', 34, 24, 3

    @load.spritesheet 'pipe', 'assets/images/pipes.png', 54,320,2

  create: ->
    @asset.cropEnabled = false

  update: ->
    @game.state.start 'menu' unless not @ready

  onLoadComplete: ->
    @ready = true

module.exports = Preloader
