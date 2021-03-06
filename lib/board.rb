
class Board
  attr_accessor :A1, :A2, :A3, :B1, :B2, :B3, :C1, :C2, :C3
  @@boxes = Array.new

######################### Set default value of each box to its corresponding reference #########################

  def initialize
    @@boxes << @A1 = "A1"
    @@boxes << @A2 = "A2"
    @@boxes << @A3 = "A3"
    @@boxes << @B1 = "B1"
    @@boxes << @B2 = "B2"
    @@boxes << @B3 = "B3"
    @@boxes << @C1 = "C1"
    @@boxes << @C2 = "C2"
    @@boxes << @C3 = "C3"
  end

######################### Defining a way to call the board #########################

  def boxes
    return @@boxes
  end

######################### Drawing the board that will be displayed on every turn #########################

  def the_board
    puts " --------------" 
    puts "| #{@A1} | #{@A2} | #{@A3} |"
    puts "|--------------|"
    puts "| #{@B1} | #{@B2} | #{@B3} |"
    puts "|--------------|"
    puts "| #{@C1} | #{@C2} | #{@C3} |"
    puts " --------------"
  end

end