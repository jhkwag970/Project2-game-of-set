
# class object to handle "Player"
# String name: name of the player
# Int score: size of array, representing the score that player earned

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