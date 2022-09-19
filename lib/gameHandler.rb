#check whether lay out cards has the set

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

  def checkAvailability(setOfCards)

    return (checkColorAvailability setOfCards) &&
      (checkNumAvailability setOfCards) &&
      (checkShadingAvailability setOfCards) &&
      (checkShapeAvailability setOfCards)
  end

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

  def printBoardDeck
    boardDeckIdx = 0
    @boardDeck.each do |item|
      print "#{boardDeckIdx} "
      puts " #{item.toString}"
      boardDeckIdx+=1
    end
  end

  def printPlayer playerArray
    playerArray.each do |player|
      puts "#{player.name} : #{player.score} points"
    end

  end
end