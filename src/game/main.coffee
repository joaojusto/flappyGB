window.onload = ->
  'use strict'

  Phaser = require 'phaser'

  game = new Phaser.Game 288, 505, Phaser.AUTO, 'flappybuddies'

  # Game States
  game.state.add 'preloader', require './states/preloader'
  game.state.add 'menu', require './states/menu'

  game.state.start 'preloader'
