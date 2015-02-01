class Play
  'use strict'

  Bird = require '../prefabs/bird'
  Ground = require '../prefabs/ground.coffee'
  PipeGroup = require '../prefabs/pipeGroup.coffee'
  Scoreboard = require '../prefabs/scoreboard.coffee'

  create:  ->
    @game.physics.startSystem(Phaser.Physics.ARCADE)
    @game.physics.arcade.gravity.y = 1200

    @background = @game.add.sprite 0, 0, 'background'

    @bird = new Bird @game, 100, @game.height/2
    @game.add.existing @bird

    @pipes = @game.add.group()

    @ground = new Ground @game, 0, 400, 335, 112
    @game.add.existing @ground

    @game.input.keyboard.addKeyCapture([Phaser.Keyboard.SPACEBAR])

    flapKey = @input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)
    flapKey.onDown.addOnce @startGame, @
    flapKey.onDown.add @bird.flap, @bird

    @game.input.onDown.addOnce @startGame, @
    @game.input.onDown.add @bird.flap, @bird

    @instructionGroup = @game.add.group()
    @instructionGroup.add(@game.add.sprite(@game.width/2, 100, 'getReady'))
    @instructionGroup.add(@game.add.sprite(@game.width/2, 325, 'instructions'))

    @instructionGroup.setAll 'anchor.x', 0.5
    @instructionGroup.setAll 'anchor.y', 0.5

    @score = 0

    @scoreText = @game.add.bitmapText @game.width/2, 10, 'flappyfont', @score.toString(), 24
    @scoreText.visible = true

    @scoreSound = @game.add.audio 'score'

  startGame: ->
    @bird.body.allowGravity = true
    @bird.alive = true

    @pipeGenerator = @game.time.events.loop(Phaser.Timer.SECOND * 1.25, @generatePipes, @)
    @pipeGenerator.timer.start()

    @instructionGroup.destroy()

  update: ->
    @game.physics.arcade.collide @bird, @ground, @deathHandler, null, @

    @pipes.forEach (pipeGroup) ->
      @checkScore pipeGroup
      @game.physics.arcade.collide @bird, pipeGroup, @deathHandler, null, this
    , this

  checkScore: (pipeGroup) ->
    if pipeGroup.exists && !pipeGroup.hasScored && pipeGroup.topPipe.world.x <= @bird.world.x
      pipeGroup.hasScored = true
      @score++
      @scoreText.setText @score.toString()
      @scoreSound.play()

  generatePipes: ->
    pipeY = @game.rnd.integerInRange -100, 100
    pipeGroup = @pipes.getFirstExists false
    unless pipeGroup
      pipeGroup = new PipeGroup @game, @pipes

    pipeGroup.reset @game.width + pipeGroup.width / 2, pipeY

  deathHandler: ->
    @bird.alive = false
    @pipes.callAll 'stop'
    @pipeGenerator.timer.stop()
    @ground.stopScroll()
    @scoreboard = new Scoreboard @game
    @game.add.existing @scoreboard
    @scoreboard.show @score

  shutdown: ->
    @bird.destroy()
    @pipes.destroy()
    @scoreboard.destroy()
    @game.input.keyboard.removeKey(Phaser.Keyboard.SPACEBAR)

module.exports = Play
