require_relative 'lib/game'

game = Game.new

gameStatus = true

while gameStatus

  if !game.addPlayer
    break
  end

  game.startGame

  puts "To end game press 1 or replay press 2"
  process = gets.to_i
  finish = 1

  if(process <= finish)
    puts "GoodBye"
    gameStatus = false
  else
    puts "Reset the game"
  end
end
