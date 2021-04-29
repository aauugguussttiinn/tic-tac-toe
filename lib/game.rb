

class Game
  attr_accessor :player1, :player2, :board

  def initialize(player1_name, player2_name, player1_symbol, player2_symbol)
    @player1 = Player.new(player1_name, player1_symbol)
    @player2 = Player.new(player2_name, player2_symbol)
    @board = Board.new
    puts
    return @board
  end

  def action_choice(a_player)
    print ("#{a_player}").blue
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

  def tour
    action(action_choice(player1.name), player1)
    if is_over? != true
      action(action_choice(player2.name), player2)
    end
  end

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

  def is_over?
    if winner_player1 == true
      return true
    elsif winner_player2 == true
      return true
    elsif board.boxes.length < 1
      return true
    else
      return false
    end
  end

  def end
    if winner_player1 == true
      puts ("#{player1.name} wins the game!").blue
    elsif winner_player2 == true
      puts ("#{player2.name} wins the game!").blue
    elsif board.boxes.length < 1
      puts ("Sorry, it is a draw game!").yellow
    end
  end

end