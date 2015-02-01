class Preloader
  'use strict'

  @asset = null
  @ready = false

  preload: ->
    @load.onLoadComplete.addOnce @onLoadComplete, @
    @asset = @add.sprite @width/2, @height/2, 'preloader'
    @asset.anchor.setTo 0.5, 0.5
    @load.setPreloadSprite @asset

    @load.image 'background', 'assets/images/background.png'
    @load.image 'ground', 'assets/images/ground.png'
    @load.image 'title', 'assets/images/title.png'
    @load.image 'startButton', 'assets/images/start-button.png'
    @load.image 'instructions', 'assets/images/instructions.png'
    @load.image 'getReady', 'assets/images/get-ready.png'
    @load.image 'scoreboard', 'assets/images/scoreboard.png'
    @load.image 'gameover', 'assets/images/gameover.png'
    @load.image 'particle', 'assets/images/particle.png'

    @load.audio 'flap', 'assets/audio/flap.wav'
    @load.audio 'score', 'assets/audio/score.wav'
    @load.audio 'pipeHit', 'assets/audio/pipe-hit.wav'
    @load.audio 'groundHit', 'assets/audio/ground-hit.wav'

    @load.spritesheet 'bird', 'assets/images/bird.png', 34, 24, 3

    @load.spritesheet 'pipe', 'assets/images/pipes.png', 54,320,2
    @load.spritesheet 'medals', 'assets/images/medals.png', 44, 46, 2

    @load.bitmapFont 'flappyfont', 'assets/fonts/flappyfont.png', 'assets/fonts/flappyfont.fnt'

  create: ->
    @asset.cropEnabled = false

  update: ->
    @game.state.start 'menu' unless not @ready

  onLoadComplete: ->
    @ready = true

module.exports = Preloader
