require 'bundler'
Bundler.require

$:.unshift File.expand_path("../lib", __FILE__)
require 'game'
require 'players'
require 'board'


my_game = Game.new
my_game.play