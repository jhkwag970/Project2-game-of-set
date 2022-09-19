# String player_name: name of the player
# Array[card] player_card: set of cards that player earned through the game
# Int score: size of array, representing the score that player earned
#
class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end

  def toString
    puts "player name: #{@name}"
    puts "score: #{@score}"
  end

end