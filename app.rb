require 'bundler'
Bundler.require

$:.unshift File.expand_path("../lib", __FILE__)
require 'game'
require 'players'
require 'board'



def playing(my_game)
  while my_game.is_over? != true
    my_game.tour
  end
  puts "End of the game"
  my_game.end
  puts
end

def play_again
  puts "Do you want to play another game ? Yes / No"
  print ">"
  decision = gets.chomp
  while decision != "Yes" && decision != "No"
    puts "Invalid answer. Do you want to play again ? Please, type 'Yes' or 'No'"
    print ">"
    decision = gets.chomp
  end
  return decision
end

puts
puts ("               ---------------------------------------------------").red
puts ("               |Welcome to 'THE FINAL TIC-TAC-TOE'!              |").red
puts ("               |If you do not know how to play, open README.md!  |").red
puts ("               ---------------------------------------------------").red
puts
puts ("Hello player 1, your symbol will be 'X'. Please choose a name").blue
player1_name = gets.chomp
puts
puts ("Hello player 2, your symbol will be 'O'. Please choose a name").blue
player2_name = gets.chomp
game_count = 1
puts
puts ("This is game number #{game_count}").red
playing(Game.new(player1_name, player2_name, "X", "O"))
while play_again == "Yes"
  game_count += 1
  puts
  puts ("This is game number #{game_count}").red
  playing(Game.new(player1_name, player2_name, "X", "O"))
end
puts ("Then goodbye, it was nice to play with you!").green