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

  # add the player into the @playerArray by receiving the input from console
  # return true if console receive valid input and false if not
  # valid inputs are natural numbers greater than 1
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

  # print the name and score of the players in @playerArray
  def printPlayer
    @playerArray.each do |player|
      puts "#{player.name} : #{player.score} points"
    end

  end

  # find the index of the input name from the @playerArray
  # return index of input name
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

  # Enter the three index numbers from boardDeck
  # fails if index number is not 0 ~ 11
  # List[card] boardDeck: array of 12 cards
  def enterIndex (boardDeck)
    puts "Enter three index numbers separated by Enter Key"
    size = 3
    enter = 0
    while(enter < size)
      num = gets.to_i

      case num
      when 0 .. (boardDeck.length - 1)
        @setOfIndex.push num
        @setOfCards.push boardDeck[num]
        enter += 1
      else
        puts "invalid index"
      end
    end

  end

  # starting the one repetition of game
  def startGame
    gameHandler = GameHandler.new
    defBoardDeckNum = 12

    puts "To make a Set, enter the name and enter the three index number"
    while(gameHandler.deck.length > 0 || gameHandler.boardDeck.length < defBoardDeckNum)
      printPlayer
      puts "------------------------------"
      gameHandler.printBoardDeck

      puts "Enter 0 if none of 12 cards are making a set to draw three more cards else enter 1"
      moreDeck = gets.to_i
      if (moreDeck == 0)
        gameHandler.drawCard
        next
      end

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

        if(gameHandler.boardDeck.length < 12)
          gameHandler.drawCard
        end
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