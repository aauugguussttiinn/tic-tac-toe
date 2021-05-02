require 'pry'

class Player
  attr_accessor :name, :symbol
  @@player_count = 1
  @@symbols = ["X", "O"]

  def initialize
    @name = naming
    @symbol = symbol_election
  end

######################### Defining a name for each new player #########################

  def naming
    puts ("Hello player #{@@player_count}. Please choose a name.").blue
    name = gets.chomp
    @@player_count += 1
    return name
  end

######################### Defining a symbol for each new player #########################

  def symbol_election
    if @@symbols.length > 1
      puts "Perfect, #{self.name.yellow}. Now please, choose a symbol : X or O ?"
      while symbol = gets.chomp
        if symbol == "X"
          @@symbols.shift
          puts "Duly noted. Your symbol is 'X'"
          return symbol
          break
        elsif symbol == "O"
          @@symbols.pop
          puts "Duly noted. Your symbol is 'O'"
          return symbol
          break
        else
          puts "Invalid option. Please, choose a symbol : X or O ?"
        end
      end
    else
      puts "Perfect, #{self.name.yellow}. Your symbol will be '#{@@symbols[0]}'."
      symbol = @@symbols[0]
      return symbol
    end
  end

end