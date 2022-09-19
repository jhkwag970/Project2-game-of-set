require_relative 'card'
require_relative 'player'
require_relative 'gameHandler'

class Game

  def initialize
    @playerIdx = 0
    @playerArray = Array.new()
    @setOfCards = Array.new()
    @setOfIndex = Array.new()
  end

  def addPlayer
    print "select number of players: "
    numberOfPlayer = gets.to_i

    if (numberOfPlayer <= 1)
      puts "Invalid input. End the game"
      return false
    end

    while(@playerIdx < numberOfPlayer)
      print "Enter your name: "
      name = gets.chomp
      player = Player.new name
      @playerArray.push player
      @playerIdx+=1
    end

    return true
  end

  def findName
    while true
      puts "Enter the name"
      playerName = gets.chomp
      playerNum = 0
      @playerArray.each do |player|
        break if playerName == player.name
        playerNum += 1
      end

      break if(@playerArray.length > playerNum)
      puts "invalid Name"
    end

    return playerNum
  end

  def enterIndex (boardDeck)
    puts "Enter three index numbers separated by Enter Key"
    size = 3
    enter = 0
    while(enter < size)
      num = gets.to_i
      case num
      when 0 .. 11
        @setOfIndex.push num
        @setOfCards.push boardDeck[num]
        enter += 1
      else
        puts "invalid index"
      end
    end

  end

  def startGame
    gameHandler = GameHandler.new
    defBoardDeckNum = 12

    puts "To make a Set, enter the name and enter the three index number"
    while(gameHandler.deck.length > 0 || gameHandler.boardDeck.length < defBoardDeckNum)
      gameHandler.printPlayer @playerArray
      puts "------------------------------"
      gameHandler.printBoardDeck

      playerNum = findName

      enterIndex gameHandler.boardDeck

      if gameHandler.checkAvailability @setOfCards
        puts "#{@playerArray[playerNum].name} is correct!"
        @playerArray[playerNum].score += 1
        @setOfIndex.sort!

        tmpIdx = 0
        @setOfIndex.each do |index|
          gameHandler.boardDeck.delete_at (@setOfIndex[tmpIdx] + tmpIdx)
          tmpIdx+=1
        end

        gameHandler.drawCard
      else
        puts "#{@playerArray[playerNum].name} is wrong"
        if @playerArray[playerNum].score > 0
          puts "Point lost.."
          @playerArray[playerNum].score -= 1
        end
      end
    end

    @playerArray[0].score = 1

    gameHandler.findWinner(@playerArray)
  end
end