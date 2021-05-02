

class Game
  attr_accessor :player1, :player2, :board
  @@game_count = 1

######################### Creating a game by creating 2 players #########################

  def initialize
    puts
    puts ("---------------------------------------------------").red
    puts ("|Welcome to 'THE FINAL TIC-TAC-TOE'!              |").red
    puts ("|If you do not know how to play, open README.md!  |").red
    puts ("---------------------------------------------------").red
    puts
    @player1 = Player.new
    puts
    @player2 = Player.new
    @board
  end

######################### Starting a game including conditions to play again #########################

  def play
    puts
    puts ("This is game number #{@@game_count}.").red
    if starter == 1
      round(@player1, @player2)
    else
      round(@player2, @player1)
    end
    while play_again == "Yes"
      @@game_count += 1
      puts
      puts ("This is game number #{@@game_count}.").red
      if winner_player1 == true
        round(@player2, @player1)
      elsif winner_player2 == true
        round(@player1, @player2)
      else
        if starter == 1
          round(@player1, @player2)
        else
          round(@player2, @player1)
        end
      end
    end
    puts ("Then goodbye, it was nice to play with you!").green
  end
  
######################### Decides who plays first #########################

  def starter
    puts ("Let's define who will start, throwing a dice. Press enter to do it.").red
    gets.chomp
    the_starter = rand(1..2)
    if the_starter == 1
      puts "......... tada ! #{@player1.name.yellow} will play first."
    else
      puts "......... tada ! #{@player2.name.yellow} will play first."
    end
    return the_starter
  end

######################### The way a round goes on #########################

  def round(starting, following)
    puts ("Ready to play ? Press entrer to begin the game").red
    gets.chomp
    @board = Board.new
    while is_over? != true
      tour(starting, following)
    end
    return ending
    puts
  end

######################### A turn for each player, depending on who wins the dice roll #########################

def tour (starting, following)
    action(action_choice(starting.name), starting)
    if is_over? != true
      action(action_choice(following.name), following)
    end
end

############################## The player can choose which box he wants to use #######################################

  def action_choice(a_player)
    print ("#{a_player}").yellow
    puts ", it is your turn to play."
    puts "This is the board situation :"
    puts @board.the_board
    puts
    puts "Which box do you want to tick?"
    print ">"
    choice = gets.chomp
    while board.boxes.include?(choice) == false
      puts "Invalid box reference. Please, pick up another box reference."
      choice = gets.chomp
    end
    return choice
  end

############################### Ticking the box selected by the player ######################################

  def action(action_choice, a_player)
    case action_choice
    when "A1"
      @board.A1 = "#{a_player.symbol} "
    when "A2"
      @board.A2 = "#{a_player.symbol} "
    when "A3"
      @board.A3 = "#{a_player.symbol} "
    when "B1"
      @board.B1 = "#{a_player.symbol} "
    when "B2"
      @board.B2 = "#{a_player.symbol} "
    when "B3"
      @board.B3 = "#{a_player.symbol} "
    when "C1"
      @board.C1 = "#{a_player.symbol} "
    when "C2"
      @board.C2 = "#{a_player.symbol} "
    when "C3"
      @board.C3 = "#{a_player.symbol} "
    end
    puts @board.the_board
    board.boxes.each {|dead| if action_choice == dead then board.boxes.delete(dead) end}
  end

################################ Cases in which player1 wins #######################################

def winner_player1
  if @board.A1 == "X " && @board.A2 == "X " && @board.A3 == "X "
    return true    
  elsif @board.B1 == "X " && @board.B2 == "X " && @board.B3 == "X "
    return true
  elsif @board.C1 == "X " && @board.C2 == "X " && @board.C3 == "X "
    return true
  elsif @board.A1 == "X " && @board.B1 == "X " && @board.C1 == "X "
    return true
  elsif @board.A2 == "X " && @board.B2 == "X " && @board.C2 == "X "
    return true
  elsif @board.A3 == "X " && @board.B3 == "X " && @board.C3 == "X "
    return true    
  elsif @board.A1 == "X " && @board.B2 == "X " && @board.C3 == "X "
    return true
  elsif @board.A3 == "X " && @board.B2 == "X " && @board.C1 == "X "
    return true 
  else
    return false
  end
end

################################ Cases in which player2 wins #######################################

  def winner_player2
    if @board.A1 == "O " && @board.A2 == "O " && @board.A3 == "O "
      return true    
    elsif @board.B1 == "O " && @board.B2 == "O " && @board.B3 == "O "
      return true
    elsif @board.C1 == "O " && @board.C2 == "O " && @board.C3 == "O "
      return true
    elsif @board.A1 == "O " && @board.B1 == "O " && @board.C1 == "O "
      return true
    elsif @board.A2 == "O " && @board.B2 == "O " && @board.C2 == "O "
      return true
    elsif @board.A3 == "O " && @board.B3 == "O " && @board.C3 == "O "
      return true    
    elsif @board.A1 == "O " && @board.B2 == "O " && @board.C3 == "O "
      return true
    elsif @board.A3 == "O " && @board.B2 == "O " && @board.C1 == "O "
      return true 
    else
      return false
    end
  end

################################ Checks if the game is over ################################ 

  def is_over?
    if winner_player1 == true
      return true
    elsif winner_player2 == true
      return true
    elsif @board.boxes.length < 1
      return true
    else
      return false
    end
  end

################################ Puts a message to explain how the game ends ################################ 

  def ending
    if winner_player1 == true
      puts ("#{@player1.name} wins the game!").blue
      return "player1 wins"
    elsif winner_player2 == true
      puts ("#{@player2.name} wins the game!").blue
      return "player2 wins"
    elsif board.boxes.length < 1
      puts ("Sorry, it is a draw game!").blue
      return "draw game"
    end
  end

######################### Offering the players to do another round #########################

  def play_again
    puts ("Do you want to play another game ? Yes / No").red
    print ">"
    decision = gets.chomp
    while decision != "Yes" && decision != "No"
      puts "Invalid answer. Do you want to play again ? Please, type 'Yes' or 'No'"
      print ">"
      decision = gets.chomp
    end
    return decision
  end

end