require_relative 'lib/game'

gameStatus = true

while gameStatus
  game = Game.new

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
