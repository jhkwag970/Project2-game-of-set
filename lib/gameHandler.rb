# Main computation of game of set
# String[] colorList: string array that contains all the elements of colors of cards
# int[] numList: integer array that contains all the element of numbers of cards
# string[] shapeList: string array that contains all the elements of shape of cards
# string[] shadingList: string array that contains all the elements of shading of cards
# list[card] deck: array of set of card objects
# list[card] boardDeck: array of 12 cards object that is drawn from deck
# integer idx: integer that store the index of deck is drawn

class GameHandler
  attr_reader :colorList, :numList, :shadingList, :shadingList, :deck, :boardDeck

  def initialize
    @colorList = %w[red green purple]
    @numList = [1,2,3]
    @shapeList = %w[diamond oval squiggles]
    @shadingList = %w[strip solid open]
    @deck = Array.new()
    @boardDeck = Array.new()
    @idx = 0

    generateDeck
    drawCard

  end

  # draw card from the @deck
  def drawCard
    firstDraw = 12
    normalDraw = 3
    if (@boardDeck.length == 0)
      while(@idx < firstDraw)
        @boardDeck.push @deck[@idx]
        @idx += 1
      end
    else
      maxIndex = @idx + normalDraw
      while(@idx < maxIndex)
        @boardDeck.push @deck[@idx]
        @idx += 1
      end
    end
  end

  # generate the deck using colorList, numList, shapeList, shadingList
  # Then, shuffle for randomness
  def generateDeck

    @colorList.each do |color|
      @numList.each do |num|
        @shapeList.each do |shape|
          @shadingList.each do |shading|
            card = Card.new color, num, shape, shading
            @deck.push card
          end
        end
      end
    end

    @deck.shuffle!

  end

=begin
  def deckPossibility

  end
=end

  # check the availability of set of the three cards that user choose
  # return true if three card is set false when not
  def checkAvailability(setOfCards)

    return (checkColorAvailability setOfCards) &&
      (checkNumAvailability setOfCards) &&
      (checkShadingAvailability setOfCards) &&
      (checkShapeAvailability setOfCards)
  end

  # check the color availability of set of the three cards that user choose
  # return true if three card is set false when not
  def checkColorAvailability(setOfCards)
    set = false
    if (setOfCards[0].color == setOfCards[1].color &&
      setOfCards[0].color == setOfCards[2].color &&
      setOfCards[1].color == setOfCards[2].color)
      set = true
    end

    if (!(setOfCards[0].color == setOfCards[1].color ||
      setOfCards[0].color == setOfCards[2].color ||
      setOfCards[1].color == setOfCards[2].color))
      set = true
    end

    return set
  end

  # check the num availability of set of the three cards that user choose
  # return true if three card is set false when not
  def checkNumAvailability(setOfCards)
    set = false
    if (setOfCards[0].num == setOfCards[1].num &&
      setOfCards[0].num == setOfCards[2].num &&
      setOfCards[1].num == setOfCards[2].num)
      set = true
    end

    if (!(setOfCards[0].num == setOfCards[1].num ||
      setOfCards[0].num == setOfCards[2].num ||
      setOfCards[1].num == setOfCards[2].num))
      set = true
    end

    return set
  end

  # check the shape availability of set of the three cards that user choose
  # return true if three card is set false when not
  def checkShapeAvailability(setOfCards)
    set = false
    if (setOfCards[0].shape == setOfCards[1].shape &&
      setOfCards[0].shape == setOfCards[2].shape &&
      setOfCards[1].shape == setOfCards[2].shape)
      set = true
    end

    if (!(setOfCards[0].shape == setOfCards[1].shape ||
      setOfCards[0].shape == setOfCards[2].shape ||
      setOfCards[1].shape == setOfCards[2].shape))
      set = true
    end

    return set
  end

  # check the shading availability of set of the three cards that user choose
  # return true if three card is set false when not
  def checkShadingAvailability(setOfCards)
    set = false
    if (setOfCards[0].shading == setOfCards[1].shading &&
      setOfCards[0].shading == setOfCards[2].shading &&
      setOfCards[1].shading == setOfCards[2].shading)
      set = true
    end

    if (!(setOfCards[0].shading == setOfCards[1].shading ||
      setOfCards[0].shading == setOfCards[2].shading ||
      setOfCards[1].shading == setOfCards[2].shading))
      set = true
    end

    return set
  end

  # Receiving the playerArray from game and find the highest score player
  # if the highest scored player is more than one, than print all the highest scored player
  # List[player] playerArray : array of set of all players who joined the game
  def findWinner(playerArray)
    maxScore = playerArray[0].score
    maxPlayer = ""
    playerArray.each do |player|
      puts "#{player.name} #{player.score}"
      if(maxScore < player.score)
        maxScore = player.score
        maxPlayer = player.name
      elsif(maxScore == player.score)
        maxPlayer += " and " + player.name
      end
    end
    puts "Winner is #{maxPlayer} !!"
  end

  #print the cards object of the @boardDeck
  def printBoardDeck
    boardDeckIdx = 0
    @boardDeck.each do |item|
      print "#{boardDeckIdx} "
      puts " #{item.toString}"
      boardDeckIdx+=1
    end
  end


end